<%@ Page Language="VB" MasterPageFile="~/_candidato/CandidatoPageJobClick.master" AutoEventWireup="false" CodeFile="publicar.aspx.vb" Inherits="_candidato_publicar" title="Jobclick" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script type="text/javascript">
        $(function () {
            $("#<%=PanelAviso.ClientID%>").dialog({ closeText: '', width: '500', title: "Aviso", height: '100', position: "top", show: { effect: 'drop', direction: "up" }, close: function () { window.location.href = "publicar.aspx" } });
        });
	</script>
    <script type="text/javascript" language="javascript">
        function limitarTexto(campo, contador, numeroLimite) {

            if (campo.value.length > numeroLimite) {
                campo.value = campo.value.substring(0, numeroLimite);

            }
            else {
                contador.innerHTML = numeroLimite - campo.value.length;

            }

        }

    </script>
    <table class="TituloBG" align="center">
        <tr>
            <td align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Cabec" runat="server" Text="Formas de enviar seu Currículo" CssClass="TituloBGText"></asp:Label>
            </td>
        </tr>
    </table>

                <asp:Panel ID="PanelAviso" runat="server" Visible="False">
                    <table id="AVISOTABELA" align="center" cellpadding="5" cellspacing="5">
                        <tr>
                            <td align="center">
                                <asp:Image ID="ImageAVISO" runat="server" 
                                    ImageUrl="~/_candidato/images/buttonOK.png" />
                            </td>
                            <td align="center">
                                <asp:Label ID="AVISOLABEL" runat="server" CssClass="msnOK"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </asp:Panel> 

    <table width="720px" cellpadding="0" cellspacing="0" align="center">
        <tr>
            <td width="30px">
                <asp:Image ID="lateral" runat="server" ImageUrl="~/images/h26.gif" /></td>
            <td width="690px" align="left">
                <asp:Label ID="html" runat="server"></asp:Label>
                <br />
                <table id="Envio" align="center" cellpadding="0" cellspacing="0" 
                    width="100%">
                    <tr>
                        <td align="center">
                            &nbsp;</td>
                        <td align="center">
                            &nbsp;</td>
                    </tr>
                </table>
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                    BorderStyle="None" DataKeyNames="idpublica" DataSourceID="SqlDataSource1" GridLines="None"
                    PageSize="5" Width="100%">
                    <Columns>
                        <asp:BoundField DataField="idpublica" HeaderText="idpublica" InsertVisible="False"
                            ReadOnly="True" SortExpression="idpublica" Visible="False" />
                        <asp:BoundField DataField="idUser" HeaderText="idUser" SortExpression="idUser" Visible="False" />
                        <asp:BoundField DataField="idcurriculo" HeaderText="idcurriculo" SortExpression="idcurriculo"
                            Visible="False" />
                        <asp:BoundField DataField="emailTO" HeaderText="Enviado para:" SortExpression="emailTO" />
                        <asp:BoundField DataField="midia" HeaderText="midia" SortExpression="midia" Visible="False" />
                        <asp:BoundField DataField="codigo" HeaderText="codigo" SortExpression="codigo" Visible="False" />
                        <asp:BoundField DataField="apresentacao" HeaderText="apresentacao" SortExpression="apresentacao"
                            Visible="False" />
                        <asp:CheckBoxField DataField="status" HeaderText="Lidos" 
                            SortExpression="status">
                            <HeaderStyle Width="60px" />
                        </asp:CheckBoxField>
                        <asp:TemplateField ShowHeader="False">
                            <HeaderStyle Width="50px" />
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Delete" OnClientClick='return confirm("Deseja excluir esta candidatura?\nAntes de excluir aguarde uma mensagem do Consultor da vaga.")'
                                    Text="Excluir"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <HeaderStyle HorizontalAlign="Left" />
                    <AlternatingRowStyle BackColor="WhiteSmoke" />
                </asp:GridView>
                <br />
                <asp:Panel ID="PanelNAVEGADOR" runat="server">
                    <asp:LinkButton ID="LinkButtonEMAIL" runat="server" CausesValidation="False" 
                        CssClass="button" ToolTip="Clique aqui para enviar seu CV por e-mail">Enviar CV por e-mail</asp:LinkButton>
                    <asp:LinkButton ID="LinkButtonDOWNLOAD2" runat="server" CssClass="button" 
                        ToolTip="Para baixar e imprimir seu CV Clique aqui">Download do CV</asp:LinkButton>
                    <asp:LinkButton ID="LinkButtonMP1" runat="server" CausesValidation="False" 
                        CssClass="button" PostBackUrl="~/_candidato/Default.aspx" 
                        ToolTip="Clique aqui para voltar ao menu principal">Menu Principal</asp:LinkButton>
                </asp:Panel>
                <br />
                <table runat="server" id="word" border="0" cellpadding="0" cellspacing="0" style="width: 100%" visible="false">
                    <tr>
                        <td style="width: 100%">
                            <table class="SubTituloBG" align="center">
                                <tr>
                                    <td align="left">&nbsp;&nbsp;<asp:Label ID="LabelENVIO" runat="server" Text="Qual o nome que deseja para o arquivo?" CssClass="TituloBGText"></asp:Label></td>
                                </tr>
                            </table>
                            <br />
                            * Informe o nome do arquivo que será enviado a você.<br />
                            <br />
                            Nome do arquivo: (Não é necessário escrever .doc)<br />
                            <asp:TextBox ID="DocName" runat="server" CssClass="InputCadFormCandidatoCV" 
                                Width="100%"></asp:TextBox><br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="DocName"
                                Display="Dynamic" ErrorMessage="* Informe o nome do arquivo que será gerado para você!"
                                SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                            <br />
                            <asp:LinkButton ID="LinkButtonDOWNLOAD" runat="server" CssClass="button" 
                                ToolTip="Preencha o nome do arquivo e clique aqui para iniciar o download">Gerar arquivo para download</asp:LinkButton>
                            <asp:LinkButton ID="LinkButtonMP" runat="server" CausesValidation="False" 
                                CssClass="button" PostBackUrl="~/_candidato/Default.aspx" 
                                ToolTip="Clique aqui para voltar ao menu principal">Menu Principal</asp:LinkButton>
                            <asp:LinkButton ID="LinkButtonCancelar1" runat="server" 
                                CausesValidation="False" CssClass="button" 
                                PostBackUrl="~/_candidato/publicar.aspx" ToolTip="Cancelar">Cancelar</asp:LinkButton>
                        </td>
                    </tr>
                </table>
 
                 <table runat="server" id="email" border="0" cellpadding="0" cellspacing="0" style="width: 100%" visible="false">
                    <tr>
                        <td style="width: 100%">
                            <table class="SubTituloBG" align="center">
                                <tr>
                                    <td align="left">&nbsp;&nbsp;<asp:Label ID="LabelEMAIL" runat="server" Text="Informe os dados da empresa que irá receber seu CV" CssClass="TituloBGText"></asp:Label></td>
                                </tr>
                            </table><br />
                            <br />
                            Informe o e-mail para envio:<br />
                            <asp:TextBox ID="email_info" runat="server" CssClass="InputCadFormCandidatoCV" 
                                Width="100%"></asp:TextBox><br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="email_info"
                                Display="Dynamic" ErrorMessage="* Campo obrigatório!" SetFocusOnError="True"></asp:RequiredFieldValidator><asp:RegularExpressionValidator
                                    ID="RegularExpressionValidator1" runat="server" ControlToValidate="email_info"
                                    Display="Dynamic" ErrorMessage="* Informe e-mail válido!" SetFocusOnError="True"
                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator><br />
                            Informe como ficou sabendo da vaga: (Jornal, WebSite ...)<br />
                            <asp:TextBox ID="DsVaga" runat="server" CssClass="InputCadFormCandidatoCV" 
                                Width="100%"></asp:TextBox><br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="DsVaga"
                                Display="Dynamic" ErrorMessage="* Como você ficou sabendo desta vaga?"></asp:RequiredFieldValidator><br />
                            Informe Código (Anúncio/Vaga):&nbsp;<br />
                            <asp:TextBox ID="codigo" runat="server" CssClass="InputCadFormCandidatoCV" 
                                Width="100%"></asp:TextBox><br />
                            <br />
                            Escreva uma apresentação: (Venho por meio desta ... etc.)<br />
                            <asp:TextBox ID="aprTextBox" runat="server" CssClass="InputCadFormCandidatoCV" Height="96px" 
                                TextMode="MultiLine" Width="100%"></asp:TextBox><br />
                            Caracteres restantes: <span id="contador">180</span> (Máximo de 180 toques)<br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="aprTextBox"
                                Display="Dynamic" ErrorMessage="* Escreva uma apresentação para o RH." SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                            <br />
                            <asp:LinkButton ID="LinkButtonENVIOCV" runat="server" CssClass="button" 
                                ToolTip="Preencha os dados da empresa e clique aqui para enviar seu CV">Enviar meu CV para a empresa informada acima</asp:LinkButton>
                            <asp:LinkButton ID="LinkButtonMPEnvio" runat="server" CausesValidation="False" 
                                CssClass="button" PostBackUrl="~/_candidato/Default.aspx">Menu Principal</asp:LinkButton>
                            <asp:LinkButton ID="LinkButtonCancelar2" runat="server" 
                                CausesValidation="False" CssClass="button" 
                                PostBackUrl="~/_candidato/publicar.aspx" ToolTip="Cancelar">Cancelar</asp:LinkButton>
                        </td>
                    </tr>
                </table>               
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
                    DeleteCommand="DELETE FROM [tbpublicaCurriculo] WHERE [idpublica] = @idpublica"
                    InsertCommand="INSERT INTO [tbpublicaCurriculo] ([idUser], [idcurriculo], [emailTO], [midia], [codigo], [apresentacao], [status]) VALUES (@idUser, @idcurriculo, @emailTO, @midia, @codigo, @apresentacao, @status)"
                    SelectCommand="SELECT [idpublica], [idUser], [idcurriculo], [emailTO], [midia], [codigo], [apresentacao], [status] FROM [tbpublicaCurriculo] WHERE (([idUser] = @idUser) AND ([idcurriculo] = @idcurriculo))"
                    UpdateCommand="UPDATE [tbpublicaCurriculo] SET [idUser] = @idUser, [idcurriculo] = @idcurriculo, [emailTO] = @emailTO, [midia] = @midia, [codigo] = @codigo, [apresentacao] = @apresentacao, [status] = @status WHERE [idpublica] = @idpublica">
                    <DeleteParameters>
                        <asp:Parameter Name="idpublica" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="idUser" Type="Int32" />
                        <asp:Parameter Name="idcurriculo" Type="Int32" />
                        <asp:Parameter Name="emailTO" Type="String" />
                        <asp:Parameter Name="midia" Type="String" />
                        <asp:Parameter Name="codigo" Type="String" />
                        <asp:Parameter Name="apresentacao" Type="String" />
                        <asp:Parameter Name="status" Type="Boolean" />
                        <asp:Parameter Name="idpublica" Type="Int32" />
                    </UpdateParameters>
                    <SelectParameters>
                        <asp:SessionParameter DefaultValue="0" Name="idUser" SessionField="idUser" Type="Int32" />
                        <asp:SessionParameter DefaultValue="0" Name="idcurriculo" SessionField="idcurriculo"
                            Type="Int32" />
                    </SelectParameters>
                    <InsertParameters>
                        <asp:Parameter Name="idUser" Type="Int32" />
                        <asp:Parameter Name="idcurriculo" Type="Int32" />
                        <asp:Parameter Name="emailTO" Type="String" />
                        <asp:Parameter Name="midia" Type="String" />
                        <asp:Parameter Name="codigo" Type="String" />
                        <asp:Parameter Name="apresentacao" Type="String" />
                        <asp:Parameter Name="status" Type="Boolean" />
                    </InsertParameters>
                </asp:SqlDataSource>
                <br />
                
            </td> 
        </tr>
    </table> 
</asp:Content>

