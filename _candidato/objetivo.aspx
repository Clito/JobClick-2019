<%@ Page Language="VB" MasterPageFile="~/_candidato/CandidatoPageJobClick.master" AutoEventWireup="false" CodeFile="objetivo.aspx.vb" Inherits="_candidato_objetivo" title="Jobclick" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script type="text/javascript">
        $(function () {
            $("#<%=PanelAviso.ClientID%>").dialog({ closeText: '', width: '500', title: "Aviso", height: '100', position: "top", show: { effect: 'drop', direction: "up"} });
        });
	</script>

    <table class="TituloBG" align="center">
        <tr>
            <td align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label 
                    ID="Cabec" runat="server" 
                    Text="Apresentação pessoal / Auto-Avaliação Profissional" 
                    CssClass="TituloBGText"></asp:Label></td>
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
                <asp:Label ID="msn" runat="server" CssClass="msn"></asp:Label>
                <br />
                <asp:Label ID="Label2" runat="server" 
                    Text="Alguns exemplos que podem ser utilizados para o preenchimento."></asp:Label>
                <br />
                <br />
                <asp:Label ID="LabelInfo" runat="server" 
                    Text="&lt;b&gt;Informação importante:&lt;/b&gt;&lt;br&gt;Para quem nunca trabalhou ou ingressou há pouco tempo no mercado, a falta de experiência é sempre um dilema na elaboração do currículo.&lt;br&gt;A dica da JobClick é dar ênfase aos estágios, atividades escolares ou extracurriculares, trabalhos voluntários, atividades sem registro, projetos e pesquisas, que possam chamar a atenção de quem está analisando seu currículo. Mas lembre-se de utilizar termos pertinentes ao objetivo proposto no currículo."></asp:Label>
                <br />
                <br />
                <asp:LinkButton ID="LinkButtonAP1" runat="server" CausesValidation="False">Exemplo de Apresentação Pessoal</asp:LinkButton>
&nbsp;|
                <asp:LinkButton ID="LinkButtonAA" runat="server" CausesValidation="False">Exemplo de Auto-Avaliação</asp:LinkButton>
                <br />
                <asp:Panel ID="PanelAP" runat="server" BackColor="Ivory" Visible="False">
                    <table ID="AP" cellpadding="8" cellspacing="8" width="100%">
                        <tr>
                            <td>
                                <br />
                                <asp:Label ID="ConteudoAP" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:LinkButton ID="LinkButtonFECHAR" runat="server" Font-Bold="True">[X] Fechar</asp:LinkButton>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <br />
                <asp:FormView ID="FormView1" runat="server" CellPadding="0" DataKeyNames="idCartaApresentacao"
                    DataSourceID="SqlDataSource1" DefaultMode="Edit" Width="100%">
                    <EditItemTemplate>
                        <asp:Label ID="LabelApresentacaopessoal" runat="server" 
                            Text="&lt;b&gt;A primeira impressão sempre é a que fica.&lt;/b&gt;&lt;br&gt;Portanto, tenha atenção redobrada para o vocabulário e o tom que você vai adotar no texto."></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                            ControlToValidate="apresentacaoTextBox" Display="Dynamic" ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <asp:TextBox ID="idcurriculoTextBox" runat="server" 
                            Text='<%# Bind("idcurriculo") %>' Visible="False" Width="1px"></asp:TextBox>
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2"
                            DataTextField="idcurriculo" DataValueField="idcurriculo" SelectedValue='<%# Bind("idcurriculo") %>'
                            Visible="False" Width="1px">
                        </asp:DropDownList>
                        <br />
                        <asp:TextBox ID="apresentacaoTextBox" runat="server" CssClass="InputCad" Height="100px"
                            Text='<%# Bind("apresentacao") %>' TextMode="MultiLine" 
                            OnDataBinding="apresentacaoTextBox_DataBinding" Width="100%"></asp:TextBox><br />
                        <asp:Label ID="LabelRealizacoesprofissionais" runat="server" 
                            Text="Realizações profissionais:" Visible="False"></asp:Label>
                        <br />
                        <asp:TextBox ID="realizacaoTextBox" runat="server" CssClass="InputCad" Height="100px"
                            Text='<%# Bind("realizacao") %>' TextMode="MultiLine" 
                            OnDataBinding="realizacaoTextBox_DataBinding" Width="100%" Visible="False"></asp:TextBox><br />
                        <asp:Label ID="LabelAutoAvaliacao" runat="server" 
                            Text="Auto-Avaliação (Profissional):"></asp:Label>
                        <br />
                        <asp:TextBox ID="resumogeralTextBox" runat="server" CssClass="InputCad" Height="100px"
                            Text='<%# Bind("resumogeral") %>' TextMode="MultiLine" 
                            OnDataBinding="resumogeralTextBox_DataBinding" Width="100%"></asp:TextBox><br />
                        <asp:Label ID="LabelObjetivo" runat="server" Text="Objetivo:" Visible="False"></asp:Label>
                        <br />
                        <asp:TextBox ID="objetivoTextBox" runat="server" CssClass="InputCad" Height="100px"
                            Text='<%# Bind("objetivo") %>' TextMode="MultiLine" 
                            OnDataBinding="objetivoTextBox_DataBinding" Width="100%" Visible="False"></asp:TextBox><br />
                        <asp:LinkButton ID="LinkButton2" runat="server" CommandName="Update" 
                            CssClass="button">Salvar</asp:LinkButton>
                        <asp:LinkButton ID="LinkButton1" runat="server" CssClass="button" 
                            PostBackUrl="~/_candidato/Default.aspx">Menu Principal</asp:LinkButton>
                        <br />
                    </EditItemTemplate>
                    <EmptyDataTemplate>
                        <table ID="ConteudoObjetivo" runat="server" cellpadding="0" cellspacing="0" 
                            width="100%">
                            <tr>
                                <td align="center">
                                    <asp:ImageButton ID="ImageButtonNew" runat="server" CausesValidation="False" 
                                        CommandName="New" ImageUrl="~/images/layoutNew/btObjetivo.png" 
                                        onload="ImageButtonNew_Load" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <br />
                                    <asp:Label ID="LabelConteudo" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>
                    <InsertItemTemplate>
                        <asp:Label ID="LabelApresentacaopessoal" runat="server" 
                            
                            Text="&lt;b&gt;A primeira impressão sempre é a que fica.&lt;/b&gt;&lt;br&gt;Portanto, tenha atenção redobrada para o vocabulário e o tom que você vai adotar no texto."></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                            ControlToValidate="apresentacaoTextBox" Display="Dynamic" ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <asp:TextBox ID="idcurriculoTextBox" runat="server" 
                            Text='<%# Bind("idcurriculo") %>' Visible="False" Width="1px"></asp:TextBox>
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2"
                            DataTextField="idcurriculo" DataValueField="idcurriculo" SelectedValue='<%# Bind("idcurriculo") %>'
                            Visible="False" Width="1px">
                        </asp:DropDownList><br />
                        <asp:TextBox ID="apresentacaoTextBox" runat="server" CssClass="InputCad" Height="100px"
                            Text='<%# Bind("apresentacao") %>' TextMode="MultiLine" 
                            OnDataBinding="apresentacaoTextBox_DataBinding" Width="100%"></asp:TextBox><br />
                        <asp:Label ID="LabelRealizacoesprofissionais" runat="server" 
                            Text="Realizações profissionais:" Visible="False"></asp:Label>
                        <asp:TextBox ID="realizacaoTextBox" runat="server" CssClass="InputCad" Height="100px"
                            Text='<%# Bind("realizacao") %>' TextMode="MultiLine" 
                            OnDataBinding="realizacaoTextBox_DataBinding" Width="100%" Visible="False"></asp:TextBox><br />
                        <asp:Label ID="LabelAutoAvaliacao" runat="server" 
                            Text="Auto-Avaliação (Profissional):"></asp:Label>
                        <br />
                        <asp:TextBox ID="resumogeralTextBox" runat="server" CssClass="InputCad" Height="100px"
                            Text='<%# Bind("resumogeral") %>' TextMode="MultiLine" 
                            OnDataBinding="resumogeralTextBox_DataBinding" Width="100%"></asp:TextBox><br />
                        <asp:Label ID="LabelObjetivo" runat="server" Text="Objetivo:" Visible="False"></asp:Label>
                        <br />
                        <asp:TextBox ID="objetivoTextBox" runat="server" CssClass="InputCad" Height="100px"
                            Text='<%# Bind("objetivo") %>' TextMode="MultiLine" 
                            OnDataBinding="objetivoTextBox_DataBinding" Width="100%" Visible="False"></asp:TextBox>
                        <br />
                        <br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                            Text="Salvar" CssClass="button"></asp:LinkButton>
                        <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False"
                            Text="Menu Principal" onclick="InsertCancelButton_Click" CssClass="button"></asp:LinkButton>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        idCartaApresentacao:
                        <asp:Label ID="idCartaApresentacaoLabel" runat="server" Text='<%# Eval("idCartaApresentacao") %>'></asp:Label><br />
                        idcurriculo:
                        <asp:Label ID="idcurriculoLabel" runat="server" Text='<%# Bind("idcurriculo") %>'></asp:Label><br />
                        apresentacao:
                        <asp:Label ID="apresentacaoLabel" runat="server" Text='<%# Bind("apresentacao") %>'></asp:Label><br />
                        realizacao:
                        <asp:Label ID="realizacaoLabel" runat="server" Text='<%# Bind("realizacao") %>'></asp:Label><br />
                        resumogeral:
                        <asp:Label ID="resumogeralLabel" runat="server" Text='<%# Bind("resumogeral") %>'></asp:Label><br />
                        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
                            Text="Edit"></asp:LinkButton>
                        <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete"
                            Text="Delete"></asp:LinkButton>
                        <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                            Text="New"></asp:LinkButton>
                    </ItemTemplate>
                </asp:FormView>
                <br />
            </td> 
        </tr>
    </table> 
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        DeleteCommand="DELETE FROM [tbCartaApresentacao] WHERE [idCartaApresentacao] = @idCartaApresentacao"
        InsertCommand="INSERT INTO [tbCartaApresentacao] ([idcurriculo], [apresentacao], [realizacao], [resumogeral], [objetivo]) VALUES (@idcurriculo, @apresentacao, @realizacao, @resumogeral, @objetivo)"
        SelectCommand="SELECT [idCartaApresentacao], [idcurriculo], [apresentacao], [realizacao], [resumogeral], [objetivo] FROM [tbCartaApresentacao] WHERE ([idcurriculo] = @idcurriculo)"
        UpdateCommand="UPDATE [tbCartaApresentacao] SET [idcurriculo] = @idcurriculo, [apresentacao] = @apresentacao, [realizacao] = @realizacao, [resumogeral] = @resumogeral, [objetivo] = @objetivo WHERE [idCartaApresentacao] = @idCartaApresentacao">
        <DeleteParameters>
            <asp:Parameter Name="idCartaApresentacao" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="idcurriculo" Type="Int32" />
            <asp:Parameter Name="apresentacao" Type="String" />
            <asp:Parameter Name="realizacao" Type="String" />
            <asp:Parameter Name="resumogeral" Type="String" />
            <asp:Parameter Name="objetivo" Type="String" />
            <asp:Parameter Name="idCartaApresentacao" Type="Int32" />
        </UpdateParameters>
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="idcurriculo" SessionField="idcurriculo"
                Type="Int32" />
        </SelectParameters>
        <InsertParameters>
            <asp:Parameter Name="idcurriculo" Type="Int32" />
            <asp:Parameter Name="apresentacao" Type="String" />
            <asp:Parameter Name="realizacao" Type="String" />
            <asp:Parameter Name="resumogeral" Type="String" />
            <asp:Parameter Name="objetivo" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        SelectCommand="SELECT [idcurriculo], [idCadastroUser] FROM [tbCurriculo] WHERE ([idcurriculo] = @idcurriculo)">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="idcurriculo" SessionField="idcurriculo"
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
            
</asp:Content>

