<%@ Page Language="VB" MasterPageFile="~/_candidato/CandidatoPageJobClick.master" MaintainScrollPositionOnPostback="false" AutoEventWireup="true" CodeFile="quiz.aspx.vb" Inherits="_usuario_quiz" title="Avaliação Profissional e Comportamental" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script type="text/javascript">
        $(function () {
            $("#<%=PanelAviso.ClientID%>").dialog({ closeText: '', width: '500', title: "Aviso", height: '100', position: "top", show: { effect: 'drop', direction: "up"} });
        });
	</script>
    <%--    <script type="text/javascript">

        $('#reload').click(function () {
            location.reload();
        });

        $(window).bind('beforeunload', function () {
            return 'Você não terminou sua avaliação.\nDeseja realmente abandonar?\nCaso afirmativo sua avaliação será encerrada!';
        });
    </script>--%>
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
<table width="800px"><tr><td align="left">
    <asp:Label ID="lbl" runat="server"></asp:Label>
    <br />
</td></tr></table>    
        
    <table class="TituloBG" align="center">
        <tr>
            <td align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label 
                    ID="Cabec" runat="server" Text="Avaliação Profissional e Comportamental" 
                    CssClass="TituloBGText"></asp:Label></td>
        </tr>
    </table>
<input id="ActiveAccordeon" type="hidden" runat="server"  value="0" />
<table runat="server" id="QUIZA" visible="true" cellpadding="5" cellspacing="5" 
        width="720px" align="center">
        <tr>
            <td valign="top" align="left">
                <asp:Label ID="idperguntaquizLabel" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="idQuizLabel" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="idRespostaLabel" runat="server" Visible="False"></asp:Label>
                <asp:DataList ID="DataListQUIZ" runat="server" DataKeyField="idQuiz" 
                    DataSourceID="SqlQUIZ" Width="100%">
                    <FooterTemplate>
                        <br />
                        <br />
                        <asp:LinkButton ID="LinkButtonCANCELAR" runat="server" CssClass="button" 
                            onclientclick='<%# Eval("OnClickButton") %>' 
                            PostBackUrl="~/_candidato/Default.aspx" 
                            ToolTip="Clique aqui para voltar para o menu principal">Menu Principal</asp:LinkButton>
                    </FooterTemplate>
                    <ItemTemplate>
                        <br />
                        <asp:LinkButton ID="nomeQuizLabel" runat="server" CommandName="Select" 
                            Text='<%# Eval("nomeQuiz") %>' CausesValidation="False" CssClass="titulo" 
                            Enabled='<%# Eval("habilitar") %>' 
                            onclientclick='<%# Eval("OnClick") %>'></asp:LinkButton>
                        <asp:Label ID="msbLabelDB" runat="server" CssClass="msnOK" 
                            Text='<%# Eval("msn") %>'></asp:Label>
                        <br />
                        <asp:Label ID="LabelSOLICITADO" runat="server" Text="Solicitado por:"></asp:Label>
                        <asp:Label ID="empresaLabel" runat="server" Text='<%# Eval("empresa") %>'></asp:Label>
                        <br />
                        <br />
                        <asp:Label ID="apresentacaoQuizLabel" runat="server" 
                            Text='<%# Eval("apresentacaoQuiz") %>' />
                        <br />
                        <br />
                        <asp:Label ID="Label4" runat="server" Text="Avaliação solicitada em:"></asp:Label>
                        <br />
                        <asp:Label ID="dataSolicitacao" runat="server" 
                            Text='<%# Eval("dataSolicitacao") %>'></asp:Label>
                        <br />
                    </ItemTemplate>
                </asp:DataList>
                <br />
                <asp:Panel ID="PanelQUIZSELECIONADO" runat="server" Visible="False">
                    <asp:DataList ID="DataListINTERNO" runat="server" DataKeyField="ID" DataSourceID="SqlQUIZSELECIONADO" Width="100%">
                        <FooterTemplate>
                            <br />
                            <br />
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="nomeQuizLabel0" runat="server" CausesValidation="False" 
                                CommandName="Select" CssClass="titulo" Enabled='<%# Eval("habilitar") %>' 
                                Text='<%# Eval("nomeQuiz") %>' onclientclick='<%# Eval("OnClickButtonI") %>'></asp:LinkButton>
                            <asp:Label ID="msbLabelDB" runat="server" CssClass="msnOK" Text='<%# Eval("msn") %>'></asp:Label>
                            <br />
                            <asp:Label ID="LabelSOLICITADO" runat="server" Text="Solicitado por:"></asp:Label>
                            <asp:Label ID="empresaLabel" runat="server" Text='<%# Eval("empresa") %>'></asp:Label>
                            <br />
                            <br />
                            <asp:Label ID="apresentacaoQuizLabel" runat="server" Text='<%# Eval("apresentacaoQuiz") %>' />
                            <br />
                            <br />
                            <asp:LinkButton ID="LinkButtonCANCELARDentro" runat="server" CssClass="button" 
                                onclick="LinkButtonCANCELARDentro_Click" 
                                onclientclick='<%# Eval("OnClickButtonI") %>' 
                                ToolTip="Clique aqui desistir e voltar para o menu principal, lembre-se você será desclassificado deste processo seletivo!">Menu Principal</asp:LinkButton>
                            <br />
                        </ItemTemplate>
                    </asp:DataList>
                </asp:Panel>
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                    ShowMessageBox="True" ShowSummary="False" />
                <br />
                <asp:Label ID="horaINILabel" runat="server" CssClass="textQUIZ"></asp:Label>
                <asp:GridView ID="GridViewQuestoes" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="idQuiz,idPerguntaQuiz,idRespostaQuiz" 
                    DataSourceID="QuizFormulario" GridLines="None" 
                    ShowHeader="False" Width="100%">
                    <AlternatingRowStyle BackColor="WhiteSmoke" BorderStyle="None" />
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                            ReadOnly="True" SortExpression="ID" Visible="False" />
                        <asp:BoundField DataField="idPerguntaQuiz" HeaderText="idPerguntaQuiz" 
                            SortExpression="idPerguntaQuiz" Visible="False" />
                        <asp:BoundField DataField="idQuiz" HeaderText="idQuiz" SortExpression="idQuiz" 
                            Visible="False" />
                        <asp:TemplateField HeaderText="perguntaQuiz" SortExpression="perguntaQuiz">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("perguntaQuiz") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" CssClass="textQUIZ" 
                                    Text='<%# Bind("perguntaQuiz") %>'></asp:Label>
                                <br />
                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("numerador") %>'></asp:Label>
                                <asp:LinkButton ID="LinkButton1" runat="server" Font-Italic="True" 
                                    Text='<%# Eval("respostaQuiz") %>' CommandName="Select"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="image" HeaderText="image" SortExpression="image" 
                            Visible="False" />
                        <asp:BoundField DataField="apresenta" HeaderText="apresenta" 
                            SortExpression="apresenta" Visible="False" />
                        <asp:TemplateField HeaderText="respostaQuiz" SortExpression="respostaQuiz" 
                            Visible="False">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("respostaQuiz") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("respostaQuiz") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="ponto" HeaderText="ponto" SortExpression="ponto" 
                            Visible="False" />
                        <asp:CheckBoxField DataField="correta" HeaderText="correta" 
                            SortExpression="correta" Visible="False" />
                        <asp:BoundField DataField="idRespostaQuiz" HeaderText="idRespostaQuiz" 
                            SortExpression="idRespostaQuiz" Visible="False" />
                        <asp:BoundField DataField="idUser" HeaderText="idUser" SortExpression="idUser" 
                            Visible="False" />
                    </Columns>
                </asp:GridView>
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <asp:SqlDataSource ID="QuizFormulario" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                    SelectCommand="_USP_QUIZ_CANDIDATO_FORMULARIO" 
                    SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="idQuizLabel" Name="idQuiz" PropertyName="Text" 
                            Type="Int32" />
                        <asp:SessionParameter Name="idUser" SessionField="idUser" Type="Int32" />
                        <asp:SessionParameter Name="idCurriculo" SessionField="idcurriculo" 
                            Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>

                <asp:SqlDataSource ID="SqlQUIZ" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                    
                    SelectCommand="_USP_QUIZ_CANDIDATO" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:SessionParameter Name="idUser" SessionField="idUser" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlPERGUNTA" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                    SelectCommand="_USP_QUIZ_PERGUNTA" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="idQuizLabel" Name="idQuiz" PropertyName="Text" 
                            Type="Int32" />
                        <asp:SessionParameter Name="idUser" SessionField="idUser" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlQuizFORM" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                    InsertCommand="_USP_QUIZ_TODA_RESULTADO" 
                    SelectCommand="_USP_QUIZ_TODA_RESULTADO" 
                    InsertCommandType="StoredProcedure" SelectCommandType="StoredProcedure">
                    <InsertParameters>
                        <asp:Parameter Name="idSetup" Type="Int32" />
                        <asp:Parameter Name="idUsuario" Type="Int32" />
                        <asp:Parameter Name="idQuiz" Type="Int32" />
                        <asp:Parameter Name="idPerguntaQuiz" Type="Int32" />
                        <asp:Parameter Name="idRespostaQuiz" Type="Int32" />
                        <asp:Parameter Name="pontos" Type="Int32" />
                        <asp:Parameter Name="horaINI" Type="DateTime" />
                        <asp:Parameter Name="horaFIM" Type="DateTime" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:SessionParameter Name="idSetup" SessionField="idSetup" Type="Int32" />
                        <asp:SessionParameter Name="idUsuario" SessionField="idUser" Type="Int32" />
                        <asp:ControlParameter ControlID="idQuizLabel" Name="idQuiz" PropertyName="Text" 
                            Type="Int32" />
                        <asp:ControlParameter ControlID="idperguntaquizLabel" Name="idPerguntaQuiz" 
                            PropertyName="Text" Type="Int32" />
                        <asp:ControlParameter ControlID="idRespostaLabel" Name="idRespostaQuiz" 
                            PropertyName="Text" Type="Int32" />
                        <asp:Parameter DefaultValue="0" Name="pontos" Type="Int32" />
                        <asp:Parameter DefaultValue="0" Name="horaINI" Type="DateTime" />
                        <asp:Parameter DefaultValue="0" Name="horaFIM" Type="DateTime" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlQUIZSELECIONADO" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                    SelectCommand="_USP_QUIZ_CANDIDATO_SELECIONADA" 
                    SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="idQuizLabel" Name="idQuiz" PropertyName="Text" 
                            Type="Int32" />
                        <asp:SessionParameter Name="idUser" SessionField="idUser" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />
            </td>
        </tr>
</table>
</asp:Content>

