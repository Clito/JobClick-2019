<%@ Page Language="VB" MasterPageFile="MasterPageJobClick.master" AutoEventWireup="false" CodeFile="faq.aspx.vb" Inherits="faq" title="FAQ" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style type="text/css">
        #menu .linkcandidato
            {
                color: #fff !important;
            }        
    </style>
    <script type="text/javascript">
        $(function () {
            $("#<%=PanelAviso.ClientID%>").dialog({ closeText: '', width: '500', close: function () { window.location.href = "faq.aspx" } });
        });
	</script>
    <table class="TituloBG" align="center">
        <tr>
            <td align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Cabec" runat="server" Text="FAQ - Ajuda aos Candidatos" CssClass="TituloBGText"></asp:Label></td>
        </tr>
    </table>
                <asp:Panel ID="PanelAviso" runat="server" Visible="False">
                    <table id="AVISOTABELA" align="center" cellpadding="5" cellspacing="5" width="100%">
                        <tr>
                            <td align="center"><asp:Label ID="AVISOLABEL" runat="server" CssClass="msnOK"></asp:Label></td>
                        </tr>
                        <tr>
                            <td align="center">
                                <asp:Image ID="ImageAVISO" runat="server" ImageUrl="~/_candidato/images/buttonOK.png" />
                                <br />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
    <table cellpadding="0" cellspacing="0" align="center">
        <tr>
            <td valign="top" align="left">
                <asp:Image ID="lateral" runat="server" ImageUrl="~/images/space.gif" 
                    Height="47px" Width="35px" /></td>
            <td valign="top" align="left">
                <br />
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                    BorderStyle="None" DataKeyNames="idFAQ" DataSourceID="SqlDataSource1" GridLines="None"
                    Width="690px">
                    <Columns>
                        <asp:BoundField DataField="idFAQ" HeaderText="idFAQ" InsertVisible="False" ReadOnly="True"
                            SortExpression="idFAQ" Visible="False" />
                        <asp:HyperLinkField DataNavigateUrlFields="idFAQ" DataNavigateUrlFormatString="faq.aspx?idFAQ={0}"
                            DataTextField="tema" HeaderText="D&#250;vidas sobre (Respondidas)" />
                        <asp:BoundField DataField="tema" HeaderText="D&#250;vidas sobre (Respondidas)" SortExpression="tema"
                            Visible="False" />
                        <asp:BoundField DataField="contaclick" HeaderText="Visitas" SortExpression="contaclick" />
                        <asp:CheckBoxField DataField="apresentar" HeaderText="apresentar" SortExpression="apresentar"
                            Visible="False" />
                    </Columns>
                    <HeaderStyle HorizontalAlign="Left" />
                    <AlternatingRowStyle BackColor="WhiteSmoke" />
                </asp:GridView>
                <br />
                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource4">
                    <ItemTemplate>
                        <spa class="titulo"><%#Eval("tema")%></spa>
                    </ItemTemplate>
                </asp:Repeater>
                <br />
                <br />
                <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                    BorderStyle="None" DataKeyNames="idFAQ" DataSourceID="SqlDataSource2" GridLines="None"
                    Width="690px">
                    <Columns>
                        <asp:BoundField DataField="idFAQ" HeaderText="idFAQ" InsertVisible="False" ReadOnly="True"
                            SortExpression="idFAQ" Visible="False" />
                        <asp:BoundField DataField="tema" HeaderText="Assunto" SortExpression="tema" Visible="False" />
                        <asp:HyperLinkField DataNavigateUrlFields="idFAQ,idFAQresAssunto" DataNavigateUrlFormatString="faq.aspx?idFAQ={0}&amp;idFAQresAssunto={1}"
                            DataTextField="duvida" HeaderText="Perguntas Frequentes: FAQs" />
                        <asp:BoundField DataField="duvida" HeaderText="D&#250;vida" SortExpression="duvida"
                            Visible="False" />
                        <asp:BoundField DataField="data" HeaderText="Data" SortExpression="data" 
                            Visible="False">
                            <ItemStyle Width="150px" />
                        </asp:BoundField>
                    </Columns>
                    <EmptyDataTemplate>
                        <div style="text-align: center">
                            <table border="0" cellpadding="0" cellspacing="0" width="100% align="left" ">
                                <tr>
                                    <td>
                                        <br />
                                        Não foi publicada nenhuma dúvida referente a este assunto,
                                        <br />
                                        gostaria de postar a sua dúvida?<br />
                                        <br />
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </EmptyDataTemplate>
                    <HeaderStyle HorizontalAlign="Left" />
                    <AlternatingRowStyle BackColor="WhiteSmoke" />
                </asp:GridView>
                <br />
                <table width="690px" height="20px" id="mytmsn" runat="server" cellpadding="10" 
                    cellspacing="0" visible="false">
                    <tr>
                        <td id="mymsn" style="width: 100%; background-color: mistyrose">
                            <asp:Label ID="lblmsg" runat="server" BackColor="Transparent" Visible="False"></asp:Label></td>
                    </tr>
                </table>
                
                <br />
                <asp:FormView ID="FormView1" runat="server" DataKeyNames="idemailres" DataSourceID="SqlDataSource3"
                    Width="690px">
                    <EditItemTemplate>
                        idemailres:
                        <asp:Label ID="idemailresLabel1" runat="server" Text='<%# Eval("idemailres") %>'>
            </asp:Label><br />
                        idFAQ:
                        <asp:TextBox ID="idFAQTextBox" runat="server" Text='<%# Bind("idFAQ") %>'>
            </asp:TextBox><br />
                        pergunta:
                        <asp:TextBox ID="perguntaTextBox" runat="server" Text='<%# Bind("pergunta") %>'>
            </asp:TextBox><br />
                        resposta:
                        <asp:TextBox ID="respostaTextBox" runat="server" Text='<%# Bind("resposta") %>'>
            </asp:TextBox><br />
                        email:
                        <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>'>
            </asp:TextBox><br />
                        nome:
                        <asp:TextBox ID="nomeTextBox" runat="server" Text='<%# Bind("nome") %>'>
            </asp:TextBox><br />
                        ip:
                        <asp:TextBox ID="ipTextBox" runat="server" Text='<%# Bind("ip") %>'>
            </asp:TextBox><br />
                        ticket:
                        <asp:TextBox ID="ticketTextBox" runat="server" Text='<%# Bind("ticket") %>'>
            </asp:TextBox><br />
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                            Text="Update">
            </asp:LinkButton>
                        <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                            Text="Cancel">
            </asp:LinkButton>
                    </EditItemTemplate>
                    <EmptyDataTemplate>
                        <table align="center" cellpadding="10" cellspacing="10">
                            <tr>
                                <td>
                                    <asp:LinkButton ID="linkbuttonFAQ" runat="server" CommandName="New" 
                                        CssClass="button" ToolTip="Clique aqui para fazer sua pergunta">Fazer uma pergunta</asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>
                    <InsertItemTemplate>
                        <asp:Panel ID="PanelFAQ" runat="server">
                            <table ID="FormFAQGeral" cellpadding="5" cellspacing="0" width="100%">
                                <tr>
                                    <td align="right">
                                        <asp:Label ID="LabelForm0" runat="server" Text="Assunto:"></asp:Label>
                                    </td>
                                    <td align="left">
                                        <asp:DropDownList ID="DropDownList1" runat="server" CssClass="DropCadFormCandidatoCV" 
                                            DataSourceID="SQLassunto" DataTextField="tema" DataValueField="idFAQ" 
                                            SelectedValue='<%# Bind("idFAQ") %>' Width="510px">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                            ControlToValidate="perguntaTextBox" Display="Dynamic" 
                                            ErrorMessage="* Sua pergunta é necessária." SetFocusOnError="True" 
                                            ValidationGroup="FormFAQ">*</asp:RequiredFieldValidator>
                                        <asp:Label ID="LabelForm1" runat="server" Text="Pergunta/Dúvida:"></asp:Label>
                                    </td>
                                    <td align="left">
                                        <asp:TextBox ID="perguntaTextBox" runat="server" CssClass="InputCadFormCandidatoCV" 
                                            Height="120px" Text='<%# Bind("pergunta") %>' TextMode="MultiLine" 
                                            Width="500px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                            ControlToValidate="nomeTextBox" Display="Dynamic" 
                                            ErrorMessage="* Seu nome é obrigatório." SetFocusOnError="True" 
                                            ValidationGroup="FormFAQ">*</asp:RequiredFieldValidator>
                                        <asp:Label ID="LabelForm2" runat="server" Text="Seu nome:"></asp:Label>
                                    </td>
                                    <td align="left">
                                        <asp:TextBox ID="nomeTextBox" runat="server" CssClass="InputCadFormCandidatoCV" 
                                            Text='<%# Bind("nome") %>' Width="500px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                            ControlToValidate="emailTextBox" Display="Dynamic" 
                                            ErrorMessage="* Informe seu e-mail." SetFocusOnError="True" 
                                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                            ValidationGroup="FormFAQ">*</asp:RegularExpressionValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                            ControlToValidate="emailTextBox" Display="Dynamic" 
                                            ErrorMessage="* Seu e-mail é obrigatório." SetFocusOnError="True" 
                                            ValidationGroup="FormFAQ">*</asp:RequiredFieldValidator>
                                        <asp:Label ID="LabelForm3" runat="server" Text="Seu e-mail:"></asp:Label>
                                    </td>
                                    <td align="left">
                                        <asp:TextBox ID="emailTextBox" runat="server" CssClass="InputCadFormCandidatoCV" 
                                            Text='<%# Bind("email") %>' Width="500px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        &nbsp;</td>
                                    <td align="left">
                                        <asp:LinkButton ID="LinkButtonENVIAR" runat="server" CommandName="Insert" 
                                            CssClass="button" 
                                            ToolTip="Preencha o formulário e clique aqui para enviar" 
                                            ValidationGroup="FormFAQ">Enviar sua dúvida</asp:LinkButton>
                                        <asp:LinkButton ID="LinkButtonCANCELAR" runat="server" CausesValidation="False" 
                                            CommandName="Cancel" CssClass="button" ToolTip="Clique aqui para cancelar">Cancelar</asp:LinkButton>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        &nbsp;</td>
                                    <td align="left">
                                        <asp:TextBox ID="ipTextBox" runat="server" CssClass="InputCad" Visible="False"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        &nbsp;</td>
                                    <td align="left">
                                        <asp:TextBox ID="ticketTextBox" runat="server" CssClass="InputCad" 
                                            Text='<%# Bind("ticket") %>' Visible="False"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        &nbsp;</td>
                                    <td align="left">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        &nbsp;</td>
                                    <td align="left">
                                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                                            ShowMessageBox="True" ShowSummary="False" ValidationGroup="FormFAQ" />
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                        <asp:TextBox ID="idFAQTextBox" runat="server" Text='<%# Bind("idFAQ") %>'
                            Visible="False" Width="1px"></asp:TextBox>
                        <asp:TextBox ID="respostaTextBox" runat="server" Text='<%# Bind("resposta") %>' 
                            Visible="False" Width="1px"></asp:TextBox><br />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        idemailres:
                        <asp:Label ID="idemailresLabel" runat="server" Text='<%# Eval("idemailres") %>'></asp:Label><br />
                        idFAQ:
                        <asp:Label ID="idFAQLabel" runat="server" Text='<%# Bind("idFAQ") %>'></asp:Label><br />
                        pergunta:
                        <asp:Label ID="perguntaLabel" runat="server" Text='<%# Bind("pergunta") %>'></asp:Label><br />
                        resposta:
                        <asp:Label ID="respostaLabel" runat="server" Text='<%# Bind("resposta") %>'></asp:Label><br />
                        email:
                        <asp:Label ID="emailLabel" runat="server" Text='<%# Bind("email") %>'></asp:Label><br />
                        nome:
                        <asp:Label ID="nomeLabel" runat="server" Text='<%# Bind("nome") %>'></asp:Label><br />
                        ip:
                        <asp:Label ID="ipLabel" runat="server" Text='<%# Bind("ip") %>'></asp:Label><br />
                        ticket:
                        <asp:Label ID="ticketLabel" runat="server" Text='<%# Bind("ticket") %>'></asp:Label><br />
                        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
                            Text="Edit"></asp:LinkButton>
                        <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete"
                            Text="Delete"></asp:LinkButton>
                        <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                            Text="New"></asp:LinkButton>
                    </ItemTemplate>
                </asp:FormView>
                &nbsp;<br />
                <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource5">
                    <ItemTemplate>
                        <table id="res" border="0" width="690px">
                            <tr>
                                <td>
                                    <b>Pergunta:</b></td>
                            </tr>
                            <tr>
                                <td bgcolor="#F0F0F0">
                                    <%# Eval("duvida") %>
                                    <br />
                                    Enviada em
                                    <%# Eval("data") %>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <b>Resposta:</b><br />
                                    <%# Eval("resposta") %>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Respondida em
                                    <%# Eval("datares") %>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;</td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:Repeater>
                <asp:Label ID="assuntoLabel" runat="server" Visible="False"></asp:Label>
                <br />
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
                    SelectCommand="SELECT [idFAQ], [tema], [contaclick], [apresentar] FROM [tbFAQ] WHERE ([apresentar] = @apresentar)">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="True" Name="apresentar" Type="Boolean" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
                    SelectCommand="SELECT idFAQ, tema, duvida, data, idFAQresAssunto FROM vwfaq WHERE (idFAQ = @idFAQ)">
                    <SelectParameters>
                        <asp:QueryStringParameter DefaultValue="0" Name="idFAQ" QueryStringField="idFAQ"
                            Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
                    DeleteCommand="DELETE FROM [tbEmail_res] WHERE [idemailres] = @idemailres" InsertCommand="INSERT INTO [tbEmail_res] ([idFAQ], [pergunta], [resposta], [email], [nome], [ip], [ticket]) VALUES (@idFAQ, @pergunta, @resposta, @email, @nome, @ip, @ticket)"
                    OnInserted="OnChangeDB" SelectCommand="SELECT [idemailres], [idFAQ], [pergunta], [resposta], [email], [nome], [ip], [ticket] FROM [tbEmail_res] WHERE ([idemailres] = @idemailres)"
                    UpdateCommand="UPDATE [tbEmail_res] SET [idFAQ] = @idFAQ, [pergunta] = @pergunta, [resposta] = @resposta, [email] = @email, [nome] = @nome, [ip] = @ip, [ticket] = @ticket WHERE [idemailres] = @idemailres">
                    <DeleteParameters>
                        <asp:Parameter Name="idemailres" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="idFAQ" Type="Int32" />
                        <asp:Parameter Name="pergunta" Type="String" />
                        <asp:Parameter Name="resposta" Type="String" />
                        <asp:Parameter Name="email" Type="String" />
                        <asp:Parameter Name="nome" Type="String" />
                        <asp:Parameter Name="ip" Type="String" />
                        <asp:Parameter Name="ticket" Type="String" />
                        <asp:Parameter Name="idemailres" Type="Int32" />
                    </UpdateParameters>
                    <SelectParameters>
                        <asp:QueryStringParameter DefaultValue="0" Name="idemailres" QueryStringField="idmailres"
                            Type="Int32" />
                    </SelectParameters>
                    <InsertParameters>
                        <asp:Parameter Name="idFAQ" Type="Int32" />
                        <asp:Parameter Name="pergunta" Type="String" />
                        <asp:Parameter Name="resposta" Type="String" />
                        <asp:Parameter Name="email" Type="String" />
                        <asp:Parameter Name="nome" Type="String" />
                        <asp:Parameter Name="ip" Type="String" />
                        <asp:Parameter Name="ticket" Type="String" />
                    </InsertParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
                    SelectCommand="SELECT [idFAQ], [tema] FROM [tbFAQ] WHERE ([idFAQ] = @idFAQ)">
                    <SelectParameters>
                        <asp:QueryStringParameter DefaultValue="0" Name="idFAQ" QueryStringField="idFaq"
                            Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
                    SelectCommand="SELECT idFAQ, duvida, data, resposta, datares, tema, idFAQresAssunto FROM vwfaq WHERE (idFAQresAssunto = @idFAQresAssunto)">
                    <SelectParameters>
                        <asp:QueryStringParameter DefaultValue="0" Name="idFAQresAssunto" QueryStringField="idFAQresAssunto" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SQLassunto" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                    SelectCommand="SELECT idFAQ, tema, contaclick, apresentar FROM tbFAQ WHERE (apresentar = @apresentar) AND (idFAQ = @idFAQ)">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="True" Name="apresentar" Type="Boolean" />
                        <asp:ControlParameter ControlID="assuntoLabel" DefaultValue="" Name="idFAQ" 
                            PropertyName="Text" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>
