<%@ Page Language="VB" MasterPageFile="~/_candidato/CurriculoPage.master" AutoEventWireup="false" CodeFile="outlook.aspx.vb" Inherits="_candidato_outlook" title="Jobclick" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Image ID="ImageCabec" runat="server" ImageUrl="~/images/candidato/titoutlook.gif" /><br />
    <table cellpadding="0" cellspacing="0" width="626">
        <tr>
            <td width="26">
                <asp:Image ID="lateral" runat="server" ImageUrl="~/images/h26.gif" /></td>
            <td width="600">
                <br />
                <asp:Image ID="entradaImg" runat="server" ImageUrl="~/images/candidato/cxentrada.gif" /><br />
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BorderStyle="None"
                    
                    DataKeyNames="idRELduvida_vaga,idRH_Gestor,emailGestor,nomeGestor,dsfuncao" 
                    DataSourceID="SqlEntrada" GridLines="None" Width="600px">
                    <Columns>
                        <asp:BoundField DataField="dscurriculo" HeaderText="dscurriculo" SortExpression="dscurriculo"
                            Visible="False" />
                        <asp:BoundField DataField="nome" HeaderText="Usu&#225;rio / Candidato" SortExpression="nome"
                            Visible="False" />
                        <asp:ButtonField CommandName="Select" DataTextField="nome" HeaderText="Usu&#225;rio / Candidato" />
                        <asp:BoundField DataField="dsfuncao" HeaderText="Ref.:" 
                            SortExpression="dsfuncao" />
                        <asp:BoundField DataField="duvida" HeaderText="duvida" SortExpression="duvida" Visible="False" />
                        <asp:BoundField DataField="email" HeaderText="E-mail" SortExpression="email" 
                            Visible="False" />
                        <asp:BoundField DataField="idvaga" HeaderText="idvaga" SortExpression="idvaga" Visible="False" />
                        <asp:BoundField DataField="idcurriculo" HeaderText="idcurriculo" SortExpression="idcurriculo"
                            Visible="False" />
                        <asp:BoundField DataField="idRELduvida_vaga" HeaderText="idRELduvida_vaga" InsertVisible="False"
                            ReadOnly="True" SortExpression="idRELduvida_vaga" Visible="False" />
                        <asp:BoundField DataField="data" DataFormatString="{0:t}" 
                            SortExpression="data" />
                    </Columns>
                    <AlternatingRowStyle CssClass="DGBGnot" />
                    <EmptyDataTemplate>
                        Não há mensagens.
                    </EmptyDataTemplate>
                </asp:GridView>
                <asp:Label ID="URLLabel" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="lblidRELduvida_vaga" runat="server" Visible="False"></asp:Label><asp:Label
                    ID="lblidvaga" runat="server" Visible="False"></asp:Label><asp:Label ID="lblidcurriculo"
                        runat="server" Visible="False"></asp:Label>
                <asp:Label ID="emailGestorLabel" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="nomeGestorLabel" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="dsfuncaoLabel" runat="server" Visible="False"></asp:Label>
                <br />
                <br />
                <asp:DataList ID="DataList1" runat="server" DataKeyField="idRELduvida_vaga" DataSourceID="SqlEntradaDetalhe"
                    Width="600px">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" CssClass="cur01st" Text="Currículo: "></asp:Label><asp:Label
                            ID="dscurriculoLabel" runat="server" CssClass="cur01" Text='<%# Eval("dscurriculo") %>'></asp:Label><br />
                        <asp:Label ID="Label2" runat="server" CssClass="cur01st" Text="Candidato:  "></asp:Label><asp:Label
                            ID="nomeLabel" runat="server" CssClass="cur01" Text='<%# Eval("nome") %>'></asp:Label><br />
                        <br />
                        <asp:Label ID="Label5" runat="server" CssClass="cur01st" Text="Resposta RH: "></asp:Label><br />
                        <asp:Label ID="RHrespostaLabel" runat="server" Text='<%# Eval("respostaRH") %>' Font-Overline="False" Font-Underline="True"></asp:Label><br />
                        <br />
                        <asp:Label ID="Label3" runat="server" CssClass="cur01st" Text="Sobre a sua pergunta/Dúvida: "></asp:Label><br />
                        <asp:Label ID="duvidaLabel" runat="server" CssClass="cur01" Text='<%# Eval("duvida") %>' Font-Italic="True"></asp:Label><br />
                        <br />
                        <asp:Label ID="Label6" runat="server" CssClass="cur01st" Text="Data do envio da pergunta: "></asp:Label><br />
                        <asp:Label ID="dataP" runat="server" Text='<%# Eval("data", "{0:g}") %>'></asp:Label><br />
                        <asp:Label ID="Label7" runat="server" CssClass="cur01st" Text="Data do envio da resposta: "></asp:Label><br />
                        <asp:Label ID="dataR" runat="server" Text='<%# Eval("dataRes", "{0:g}") %>'></asp:Label><br />
                        <br />
                        <asp:Label ID="Label4" runat="server" CssClass="cur01st" Text="E-mail: "></asp:Label><asp:Label
                            ID="emailLabel" runat="server" CssClass="cur01" Text='<%# Eval("email") %>'></asp:Label><asp:Label
                                ID="lblidcurriculo" runat="server" Text='<%# Eval("idcurriculo") %>' Visible="False"></asp:Label><asp:Label
                                    ID="lblidvaga" runat="server" Text='<%# Eval("idvaga") %>' Visible="False"></asp:Label>
                    </ItemTemplate>
                </asp:DataList><asp:FormView ID="FormView1" runat="server" DataKeyNames="idRELduvida_vaga"
                    DataSourceID="SqlEntradaSelect" Width="600px">
                    <EditItemTemplate>
                        <asp:Label ID="idRELduvida_vagaLabel1" runat="server" Text='<%# Eval("idRELduvida_vaga") %>'
                            Visible="False"></asp:Label>
                        <asp:CheckBox ID="liberarRHCheckBox" runat="server" Checked='<%# Bind("liberarRH") %>'
                            Visible="False" />
                        <asp:CheckBox ID="liberarCandidatoCheckBox" runat="server" Checked='<%# Bind("liberarCandidato") %>'
                            Visible="False" /><asp:TextBox ID="idvagaTextBox" runat="server" Text='<%# Bind("idvaga") %>'
                                Visible="False"></asp:TextBox>
                        <asp:TextBox ID="idcurriculoTextBox" runat="server" Text='<%# Bind("idcurriculo") %>'
                            Visible="False"></asp:TextBox>
                        <asp:TextBox ID="duvidaTextBox" runat="server" Text='<%# Bind("duvida") %>' TextMode="MultiLine"
                            Visible="False" Width="16px"></asp:TextBox>
                        <asp:TextBox ID="respostaRHTextBox" runat="server" CssClass="InputCadEmp"
                            Text='<%# Bind("respostaRH") %>' TextMode="MultiLine" Width="16px" OnDataBinding="respostaRHTextBox_DataBinding" Visible="False"></asp:TextBox><br />
                        <br />
                        <asp:TextBox ID="TextBoxRES" runat="server" CssClass="InputCadEmp" Height="160px"
                            TextMode="MultiLine" Width="610px"></asp:TextBox><br />
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="respostaRHTextBox"
                            ErrorMessage="A sua resposta é necessária para o envio desta mensagem." SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                        <asp:Image ID="Image2" runat="server" ImageUrl="~/images/candidato/linha.gif" Height="1px" Width="600px" /><br />
                        <asp:ImageButton ID="btenviar" runat="server" CommandName="Update" ImageUrl="~/images/empresa/enviar.gif" /><asp:Image
                            ID="Image5" runat="server" Height="19px" ImageUrl="~/images/empresa/espaco.gif"
                            Width="5px" /><asp:ImageButton ID="ImageButton3" runat="server" CausesValidation="False"
                                CommandName="Cancel" ImageUrl="~/images/empresa/cancelar.gif" />
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="idvagaTextBox" runat="server" Text='<%# Bind("idvaga") %>' Visible="False"
                            Width="24px"></asp:TextBox><asp:TextBox ID="idcurriculoTextBox" runat="server" Text='<%# Bind("idcurriculo") %>'
                                Visible="False" Width="24px"></asp:TextBox>
                        <asp:CheckBox ID="liberarRHCheckBox" runat="server" Checked='<%# Bind("liberarRH") %>'
                            Visible="False" />
                        <asp:CheckBox ID="liberarCandidatoCheckBox" runat="server" Checked='<%# Bind("liberarCandidato") %>'
                            Visible="False" /><br />
                        Assunto:<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="duvidaTextBox"
                            Display="Dynamic" ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                        <asp:TextBox ID="duvidaTextBox" runat="server" CssClass="InputCadEmp" Text='<%# Bind("duvida") %>'
                            Width="610px"></asp:TextBox><br />
                        Mensagem:<br />
                        <asp:TextBox ID="respostaRHTextBox" runat="server" CssClass="InputCadEmp" Height="160px"
                            Text='<%# Bind("respostaRH") %>' TextMode="MultiLine" Width="610px"></asp:TextBox><br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="respostaRHTextBox"
                            Display="Dynamic" ErrorMessage="A sua resposta é necessária para o envio desta mensagem."
                            SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                        <asp:Image ID="Image2" runat="server" ImageUrl="~/images/candidato/linha.gif" Height="1px" Width="600px" /><br />
                        <asp:ImageButton ID="ImageButton4" runat="server" CommandName="Insert" ImageUrl="~/images/empresa/enviar.gif" /><asp:Image
                            ID="Image5" runat="server" Height="19px" ImageUrl="~/images/empresa/espaco.gif"
                            Width="5px" /><asp:ImageButton ID="ImageButton5" runat="server" CausesValidation="False"
                                CommandName="Cancel" ImageUrl="~/images/empresa/cancelar.gif" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Image ID="Image2" runat="server" ImageUrl="~/images/candidato/linha.gif" Height="1px" Width="600px" /><br />
                        <asp:ImageButton ID="ImageButton1" runat="server" CommandName="Edit" ImageUrl="~/images/empresa/responder.gif" /><asp:Image
                            ID="Image3" runat="server" Height="19px" ImageUrl="~/images/empresa/espaco.gif"
                            Width="5px" /><asp:ImageButton ID="btexcluir" runat="server" CommandName="Delete"
                                ImageUrl="~/images/empresa/excluir.gif" OnClientClick='return confirm("Quer excluir esta mensagem?")' /><asp:Image
                                    ID="Image4" runat="server" Height="19px" ImageUrl="~/images/empresa/espaco.gif"
                                    Width="5px" /><asp:ImageButton ID="ImageButton6"
                                                runat="server" ImageUrl="~/images/empresa/fechar.gif" OnClick="ImageButton6_Click" />
                    </ItemTemplate>
                </asp:FormView>
                <br />
                <br />
                <asp:Image ID="Image1" runat="server" ImageUrl="~/images/candidato/cxsaida.gif" /><br />
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" BorderStyle="None"
                    DataKeyNames="idRELduvida_vaga" DataSourceID="SqlEnviados" GridLines="None" ShowHeader="False"
                    Width="600px">
                    <Columns>
                        <asp:BoundField DataField="dscurriculo" HeaderText="dscurriculo" SortExpression="dscurriculo"
                            Visible="False" />
                        <asp:BoundField DataField="nome" HeaderText="Usu&#225;rio / Candidato" SortExpression="nome"
                            Visible="False" />
                        <asp:ButtonField CommandName="Select" DataTextField="nome" HeaderText="Usu&#225;rio / Candidato" />
                        <asp:BoundField DataField="duvida" HeaderText="duvida" SortExpression="duvida" Visible="False" />
                        <asp:BoundField DataField="email" HeaderText="E-mail" SortExpression="email" />
                        <asp:BoundField DataField="idcurriculo" HeaderText="idcurriculo" SortExpression="idcurriculo"
                            Visible="False" />
                        <asp:BoundField DataField="idRELduvida_vaga" HeaderText="idRELduvida_vaga" InsertVisible="False"
                            ReadOnly="True" SortExpression="idRELduvida_vaga" Visible="False" />
                        <asp:BoundField DataField="idvaga" HeaderText="idvaga" SortExpression="idvaga" Visible="False" />
                        <asp:BoundField DataField="dataRes" DataFormatString="{0:D}" HeaderText="dataRes"
                            SortExpression="dataRes" />
                    </Columns>
                    <EmptyDataTemplate>
                        Não há mensagens.
                    </EmptyDataTemplate>
                    <AlternatingRowStyle CssClass="DGBGnot" />
                </asp:GridView>
                <asp:Label ID="lblidRELduvida_vagaEnviado" runat="server" Visible="False"></asp:Label><br />
                <asp:DataList ID="DataList2" runat="server" DataKeyField="idRELduvida_vaga" DataSourceID="SqlEnviadoSelect"
                    Width="600px">
                    <ItemTemplate>
                        <asp:Label ID="Label9" runat="server" CssClass="cur01st" Text="* Sua resposta enviada: "></asp:Label><br />
                        <asp:Label ID="duvidaLabel" runat="server" Font-Bold="True" Text='<%# Eval("duvida") %>' Font-Italic="True"></asp:Label><br />
                        <br />
                        <asp:Label ID="Label8" runat="server" CssClass="cur01st" Text="Resposta do RH: "></asp:Label><br />
                        <asp:Label ID="respostaRHLabel" runat="server" Text='<%# Eval("respostaRH") %>'></asp:Label><br />
                        <br />
                        <asp:ImageButton ID="ImageButton7" runat="server" ImageUrl="~/images/empresa/fechar.gif"
                            OnClick="ImageButton7_Click" />
                    </ItemTemplate>
                </asp:DataList></td>
        </tr>
    </table>
    <asp:SqlDataSource ID="SqlEntrada" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        
        SelectCommand="uspOutlookCandidato" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="lblidcurriculo" DefaultValue="" 
                Name="idcurriculo" PropertyName="Text" />
            <asp:Parameter DefaultValue="1" Name="liberarRH" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlEntradaSelect" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        DeleteCommand="DELETE FROM [tbRELduvida_vaga] WHERE [idRELduvida_vaga] = @idRELduvida_vaga"
        InsertCommand="INSERT INTO [tbRELduvida_vaga] ([idvaga], [idcurriculo], [duvida], [respostaRH], [liberarRH], [liberarCandidato]) VALUES (@idvaga, @idcurriculo, @duvida, @respostaRH, @liberarRH, @liberarCandidato)"
        SelectCommand="SELECT idRELduvida_vaga, idvaga, idcurriculo, duvida, respostaRH, liberarRH, liberarCandidato, dataRes FROM tbRELduvida_vaga WHERE (idRELduvida_vaga = @idRELduvida_vaga)"
        UpdateCommand="UPDATE tbRELduvida_vaga SET idvaga = @idvaga, idcurriculo = @idcurriculo, duvida = @duvida, respostaRH = @respostaRH, liberarRH = @liberarRH, liberarCandidato = @liberarCandidato, dataRes = { fn NOW() } WHERE (idRELduvida_vaga = @idRELduvida_vaga)">
        <SelectParameters>
            <asp:ControlParameter ControlID="lblidRELduvida_vaga" DefaultValue="0" Name="idRELduvida_vaga"
                PropertyName="Text" Type="Int32" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="idRELduvida_vaga" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="idvaga" Type="Int32" />
            <asp:Parameter Name="idcurriculo" Type="Int32" />
            <asp:Parameter Name="duvida" Type="String" />
            <asp:Parameter Name="respostaRH" Type="String" />
            <asp:Parameter Name="liberarRH" Type="Boolean" />
            <asp:Parameter Name="liberarCandidato" Type="Boolean" />
            <asp:Parameter Name="idRELduvida_vaga" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="idvaga" Type="Int32" />
            <asp:Parameter Name="idcurriculo" Type="Int32" />
            <asp:Parameter Name="duvida" Type="String" />
            <asp:Parameter Name="respostaRH" Type="String" />
            <asp:Parameter Name="liberarRH" Type="Boolean" />
            <asp:Parameter Name="liberarCandidato" Type="Boolean" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlEntradaDetalhe" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        SelectCommand="SELECT tbCurriculo.dscurriculo, tbCadastroUser.nome, tbRELduvida_vaga.duvida, tbuser.email, tbRELduvida_vaga.idcurriculo, tbRELduvida_vaga.idRELduvida_vaga, tbRELduvida_vaga.idvaga, tbRELduvida_vaga.respostaRH, tbRELduvida_vaga.data, tbRELduvida_vaga.dataRes FROM tbRELduvida_vaga INNER JOIN tbCurriculo ON tbRELduvida_vaga.idcurriculo = tbCurriculo.idcurriculo INNER JOIN tbCadastroUser ON tbCurriculo.idCadastroUser = tbCadastroUser.idCadastroUser INNER JOIN tbuser ON tbCadastroUser.idUser = tbuser.idUser WHERE (tbRELduvida_vaga.idRELduvida_vaga = @idRELduvida_vaga)">
        <SelectParameters>
            <asp:ControlParameter ControlID="lblidRELduvida_vaga" DefaultValue="0" Name="idRELduvida_vaga"
                PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <asp:SqlDataSource ID="SqlEnviados" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        SelectCommand="SELECT tbCurriculo.dscurriculo, tbCadastroUser.nome, tbRELduvida_vaga.duvida, tbuser.email, tbRELduvida_vaga.idcurriculo, tbRELduvida_vaga.idRELduvida_vaga, tbRELduvida_vaga.idvaga, tbRELduvida_vaga.liberarRH, tbRELduvida_vaga.dataRes FROM tbRELduvida_vaga INNER JOIN tbCurriculo ON tbRELduvida_vaga.idcurriculo = tbCurriculo.idcurriculo INNER JOIN tbCadastroUser ON tbCurriculo.idCadastroUser = tbCadastroUser.idCadastroUser INNER JOIN tbuser ON tbCadastroUser.idUser = tbuser.idUser WHERE (tbRELduvida_vaga.liberarRH = @liberarRH) AND (tbRELduvida_vaga.idcurriculo = @idcurriculo)">
        <SelectParameters>
            <asp:Parameter DefaultValue="0" Name="liberarRH" />
            <asp:ControlParameter ControlID="lblidcurriculo" DefaultValue="" Name="idcurriculo"
                PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlEnviadoSelect" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        DeleteCommand="DELETE FROM [tbRELduvida_vaga] WHERE [idRELduvida_vaga] = @idRELduvida_vaga"
        InsertCommand="INSERT INTO [tbRELduvida_vaga] ([idvaga], [idcurriculo], [duvida], [respostaRH], [liberarRH], [liberarCandidato]) VALUES (@idvaga, @idcurriculo, @duvida, @respostaRH, @liberarRH, @liberarCandidato)"
        SelectCommand="SELECT [idRELduvida_vaga], [idvaga], [idcurriculo], [duvida], [respostaRH], [liberarRH], [liberarCandidato] FROM [tbRELduvida_vaga] WHERE ([idRELduvida_vaga] = @idRELduvida_vaga)"
        UpdateCommand="UPDATE [tbRELduvida_vaga] SET [idvaga] = @idvaga, [idcurriculo] = @idcurriculo, [duvida] = @duvida, [respostaRH] = @respostaRH, [liberarRH] = @liberarRH, [liberarCandidato] = @liberarCandidato WHERE [idRELduvida_vaga] = @idRELduvida_vaga">
        <SelectParameters>
            <asp:ControlParameter ControlID="lblidRELduvida_vagaEnviado" Name="idRELduvida_vaga"
                PropertyName="Text" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="idRELduvida_vaga" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="idvaga" Type="Int32" />
            <asp:Parameter Name="idcurriculo" Type="Int32" />
            <asp:Parameter Name="duvida" Type="String" />
            <asp:Parameter Name="respostaRH" Type="String" />
            <asp:Parameter Name="liberarRH" Type="Boolean" />
            <asp:Parameter Name="liberarCandidato" Type="Boolean" />
            <asp:Parameter Name="idRELduvida_vaga" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="idvaga" Type="Int32" />
            <asp:Parameter Name="idcurriculo" Type="Int32" />
            <asp:Parameter Name="duvida" Type="String" />
            <asp:Parameter Name="respostaRH" Type="String" />
            <asp:Parameter Name="liberarRH" Type="Boolean" />
            <asp:Parameter Name="liberarCandidato" Type="Boolean" />
        </InsertParameters>
    </asp:SqlDataSource>
    <br />
</asp:Content>

