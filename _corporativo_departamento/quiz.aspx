<%@ Page Title="" Language="VB" MasterPageFile="~/_corporativo_departamento/corporativoPage.master" AutoEventWireup="false" CodeFile="quiz.aspx.vb" Inherits="_corporativo_quiz" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script type="text/javascript">
        $(function () {
            $("#<%=PanelAviso.ClientID%>").dialog({ closeText: '', width: '500', title: "Aviso", height: '100', position: "top", show: { effect: 'drop', direction: "up"} });
        });
	</script>
                <asp:Panel ID="PanelAviso" runat="server" Visible="False">
                    <table id="AVISOTABELA" align="center" cellpadding="5" cellspacing="5">
                        <tr>
                            <td align="center">
                                <asp:Image ID="ImageAVISO" runat="server" 
                                    ImageUrl="~/_corporativo/images/buttonOK.png" />
                            </td>
                            <td align="center">
                                <asp:Label ID="AVISOLABEL" runat="server" 
                                    CssClass="textoProcessoSeletivoABERTO"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <table cellpadding="0" cellspacing="0" align="center" width="100%">
                    <tr>
                        <td>
                            <br />
                            <br />
                            <br />
                                <table cellpadding="0" cellspacing="0" id="BodyInterno" width="900px" align="center">
                                    <tr>
                                        <td align="left">
                                            <asp:GridView ID="GridViewQuiz" runat="server" AutoGenerateColumns="False" 
                                                BorderStyle="None" DataKeyNames="idQuiz" DataSourceID="SqlDataViewQuiz" 
                                                GridLines="None" Width="100%" AllowPaging="True">
                                                <AlternatingRowStyle BackColor="#EEEEEE" />
                                                <Columns>
                                                    <asp:BoundField DataField="idQuiz" HeaderText="idQuiz" InsertVisible="False" 
                                                        ReadOnly="True" SortExpression="idQuiz" Visible="False" />
                                                    <asp:BoundField DataField="idSetup" HeaderText="idSetup" 
                                                        SortExpression="idSetup" Visible="False" />
                                                    <asp:BoundField DataField="idCadastroEmpresa" HeaderText="idCadastroEmpresa" 
                                                        SortExpression="idCadastroEmpresa" Visible="False" />
                                                    <asp:BoundField DataField="idCadastroEmpresa_Filha" 
                                                        HeaderText="idCadastroEmpresa_Filha" SortExpression="idCadastroEmpresa_Filha" 
                                                        Visible="False" />
                                                    <asp:BoundField DataField="corte" HeaderText="Nota de corte" 
                                                        SortExpression="corte">
                                                    <HeaderStyle HorizontalAlign="Left" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="tempoCadaPergunta" 
                                                        HeaderText="Tempo" 
                                                        SortExpression="tempoCadaPergunta">
                                                    <HeaderStyle HorizontalAlign="Left" />
                                                    </asp:BoundField>
                                                    <asp:ButtonField CommandName="Select" DataTextField="nomeQuiz" 
                                                        HeaderText="Avaliação(ões)" Text="Button">
                                                    <HeaderStyle HorizontalAlign="Left" />
                                                    </asp:ButtonField>
                                                    <asp:TemplateField HeaderText="Apresentação" SortExpression="apresentacaoQuiz" 
                                                        Visible="False">
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="TextBox1" runat="server" 
                                                                Text='<%# Bind("apresentacaoQuiz") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("apresentacaoQuiz") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle HorizontalAlign="Left" Width="320px" />
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="publicar" HeaderText="Publicado" 
                                                        SortExpression="publicar">
                                                    <HeaderStyle HorizontalAlign="Left" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="dataQuiz" HeaderText="Data da criação" 
                                                        SortExpression="dataQuiz" DataFormatString="{0:d}">
                                                    <HeaderStyle HorizontalAlign="Left" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="pontos" HeaderText="Meta" SortExpression="pontos">
                                                    <HeaderStyle HorizontalAlign="Left" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="Perguntas" HeaderText="Nº perguntas" 
                                                        SortExpression="Perguntas" />
                                                    <asp:BoundField DataField="idPerguntaQuiz" HeaderText="idPerguntaQuiz" 
                                                        InsertVisible="False" SortExpression="idPerguntaQuiz" Visible="False" />
                                                </Columns>
                                            </asp:GridView>
                                            <asp:Label ID="idQuizLabel" runat="server" Visible="False"></asp:Label>
                                            <asp:Label ID="idPerguntaQuizLabel" runat="server" Visible="False"></asp:Label>
                                            <asp:Label ID="idRespostaQuizLabel" runat="server" Visible="False"></asp:Label>
                                            <br />
                                            <br />
                                            <br />
                                            <asp:FormView ID="FormViewQUIZ" runat="server" DataKeyNames="idQuiz" 
                                                DataSourceID="SqlDataViewQuizFORM" Width="100%">
                                                <EditItemTemplate>
                                                    <table ID="Quiz0" cellpadding="2" cellspacing="0" width="930px">
                                                        <tr>
                                                            <td align="right" valign="top" width="250px">
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                                                    ControlToValidate="nomeQuizTextBox" 
                                                                    ErrorMessage="Nome da avaliação é obrigatório">*</asp:RequiredFieldValidator>
                                                                <asp:Label ID="Label5" runat="server" Text="Nome para a avaliação:"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="nomeQuizTextBox" runat="server" 
                                                                    CssClass="InputCadFormCandidatoCV" Text='<%# Bind("nomeQuiz") %>' />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right" valign="top" width="250px">
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                                                    ControlToValidate="apresentacaoQuizTextBox" 
                                                                    ErrorMessage="Apresentação da avaliação é obrigatório">*</asp:RequiredFieldValidator>
                                                                <asp:Label ID="Label6" runat="server" 
                                                                    Text="Texto que será apresentado ao candidato:"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="apresentacaoQuizTextBox" runat="server" 
                                                                    CssClass="InputCadFormCandidatoCV" Height="150px" 
                                                                    Text='<%# Bind("apresentacaoQuiz") %>' TextMode="MultiLine" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right" valign="top" width="250px">
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                                                    ControlToValidate="corteTextBox" ErrorMessage="Corte é obrigatório">*</asp:RequiredFieldValidator>
                                                                <asp:Label ID="Label2" runat="server" Text="Nota de corte:"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="corteTextBox" runat="server" 
                                                                    CssClass="InputCadFormCandidatoCV" Text='<%# Bind("corte") %>' Width="80px" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right" valign="top" width="250px">
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                                                    ControlToValidate="tempoCadaPerguntaTextBox" ErrorMessage="Tempo é obrigatório">*</asp:RequiredFieldValidator>
                                                                <asp:Label ID="Label3" runat="server" 
                                                                    Text="Tempo em minutos para cada resposta:"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="tempoCadaPerguntaTextBox" runat="server" 
                                                                    CssClass="InputCadFormCandidatoCV" Text='<%# Bind("tempoCadaPergunta") %>' 
                                                                    Width="80px" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right" valign="top" width="250px">
                                                                <asp:Label ID="Label4" runat="server" Text="Nível da avaliação:"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:DropDownList ID="DropDownListNivel" runat="server" 
                                                                    CssClass="DropCadFormCandidatoCV" SelectedValue='<%# Bind("nivel") %>' 
                                                                    Width="85px">
                                                                    <asp:ListItem>Alto</asp:ListItem>
                                                                    <asp:ListItem>Médio</asp:ListItem>
                                                                    <asp:ListItem>Baixo</asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right" valign="top" width="250px">
                                                                <asp:Label ID="Label8" runat="server" Text="Publicar avaliação:"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:RadioButtonList ID="RadioButtonList2" runat="server" 
                                                                    RepeatDirection="Horizontal" SelectedValue='<%# Bind("publicar") %>'>
                                                                    <asp:ListItem Selected="True" Value="1">Sim</asp:ListItem>
                                                                    <asp:ListItem Value="0">Não</asp:ListItem>
                                                                </asp:RadioButtonList>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right" valign="top" width="250px">
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                                                    ControlToValidate="pontosTextBox" ErrorMessage="Meta é obrigatório">*</asp:RequiredFieldValidator>
                                                                <asp:Label ID="Label7" runat="server" Text="Meta para a avaliação:"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="pontosTextBox" runat="server" 
                                                                    CssClass="InputCadFormCandidatoCV" Text='<%# Bind("pontos") %>' Width="80px" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right" valign="top" width="250px">
                                                                &nbsp;</td>
                                                            <td>
                                                                <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right" valign="top" width="250px">
                                                                <asp:TextBox ID="dataQuizTextBox" runat="server" Text='<%# Bind("dataQuiz") %>' 
                                                                    Visible="False" Width="10px" />
                                                                <asp:TextBox ID="idCadastroEmpresa_FilhaTextBox" runat="server" 
                                                                    Text='<%# Bind("idCadastroEmpresa_Filha") %>' Visible="False" Width="10px" />
                                                                <asp:TextBox ID="idCadastroEmpresaTextBox" runat="server" 
                                                                    Text='<%# Bind("idCadastroEmpresa") %>' Visible="False" Width="10px" />
                                                                <asp:TextBox ID="idSetupTextBox" runat="server" Text='<%# Bind("idSetup") %>' 
                                                                    Visible="False" Width="10px" />
                                                            </td>
                                                            <td>
                                                                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                                                                    CommandName="Update" CssClass="button" Text="Salvar" ToolTip="Salvar" />
                                                                <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" 
                                                                    CommandName="Cancel" CssClass="button" Text="Cancelar" ToolTip="Cancelar" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </EditItemTemplate>
                                                <EmptyDataTemplate>
                                                    <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                                                        CommandName="New" CssClass="button" Text="Incluir uma avaliação" 
                                                        ToolTip="Clique aqui para incluir uma nova avaliação" />
                                                </EmptyDataTemplate>
                                                <InsertItemTemplate>
                                                    <table ID="Quiz" cellpadding="2" cellspacing="0" width="930px">
                                                        <tr>
                                                            <td align="right" valign="top" width="250px">
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                                                    ControlToValidate="nomeQuizTextBox" 
                                                                    ErrorMessage="Nome da avaliação é obrigatório">*</asp:RequiredFieldValidator>
                                                                <asp:Label ID="Label5" runat="server" Text="Nome para a avaliação:"></asp:Label>
                                                            </td>
                                                            <td>
                                                                
                                                                <asp:TextBox ID="nomeQuizTextBox" runat="server" 
                                                                    CssClass="InputCadFormCandidatoCV" Text='<%# Bind("nomeQuiz") %>' />
                                                                
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right" valign="top" width="250px">
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                                                    ControlToValidate="apresentacaoQuizTextBox" 
                                                                    ErrorMessage="Apresentação da avaliação é obrigatório">*</asp:RequiredFieldValidator>
                                                                <asp:Label ID="Label6" runat="server" 
                                                                    Text="Texto que será apresentado ao candidato:"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="apresentacaoQuizTextBox" runat="server" 
                                                                    CssClass="InputCadFormCandidatoCV" Height="150px" 
                                                                    Text='<%# Bind("apresentacaoQuiz") %>' TextMode="MultiLine" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right" valign="top" width="250px">
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                                                    ControlToValidate="corteTextBox" ErrorMessage="Corte é obrigatório">*</asp:RequiredFieldValidator>
                                                                <asp:Label ID="Label2" runat="server" Text="Nota de corte:"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="corteTextBox" runat="server" 
                                                                    CssClass="InputCadFormCandidatoCV" Text='<%# Bind("corte") %>' Width="80px" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right" valign="top" width="250px">
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                                                    ControlToValidate="tempoCadaPerguntaTextBox" ErrorMessage="Tempo é obrigatório">*</asp:RequiredFieldValidator>
                                                                <asp:Label ID="Label3" runat="server" 
                                                                    Text="Tempo em minutos para cada resposta:"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="tempoCadaPerguntaTextBox" runat="server" 
                                                                    CssClass="InputCadFormCandidatoCV" Text='<%# Bind("tempoCadaPergunta") %>' 
                                                                    Width="80px" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right" valign="top" width="250px">
                                                                <asp:Label ID="Label4" runat="server" Text="Nível da avaliação:"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:DropDownList ID="DropDownListNivel" runat="server" 
                                                                    CssClass="DropCadFormCandidatoCV" SelectedValue='<%# Bind("nivel") %>' 
                                                                    Width="85px">
                                                                    <asp:ListItem>Alto</asp:ListItem>
                                                                    <asp:ListItem>Médio</asp:ListItem>
                                                                    <asp:ListItem>Baixo</asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right" valign="top" width="250px">
                                                                <asp:Label ID="Label8" runat="server" Text="Publicar avaliação:"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:RadioButtonList ID="RadioButtonList2" runat="server" 
                                                                    RepeatDirection="Horizontal" SelectedValue='<%# Bind("publicar") %>'>
                                                                    <asp:ListItem Selected="True" Value="1">Sim</asp:ListItem>
                                                                    <asp:ListItem Value="0">Não</asp:ListItem>
                                                                </asp:RadioButtonList>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right" valign="top" width="250px">
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                                                    ControlToValidate="pontosTextBox" ErrorMessage="Meta é obrigatório">*</asp:RequiredFieldValidator>
                                                                <asp:Label ID="Label7" runat="server" Text="Meta para a avaliação:"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="pontosTextBox" runat="server" 
                                                                    CssClass="InputCadFormCandidatoCV" Text='<%# Bind("pontos") %>' Width="80px" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right" valign="top" width="250px">
                                                                &nbsp;</td>
                                                            <td>
                                                                <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right" valign="top" width="250px">
                                                                <asp:TextBox ID="dataQuizTextBox" runat="server" Text='<%# Bind("dataQuiz") %>' 
                                                                    Visible="False" Width="10px" />
                                                                <asp:TextBox ID="idCadastroEmpresa_FilhaTextBox" runat="server" 
                                                                    Text='<%# Bind("idCadastroEmpresa_Filha") %>' Visible="False" Width="10px" />
                                                                <asp:TextBox ID="idCadastroEmpresaTextBox" runat="server" 
                                                                    Text='<%# Bind("idCadastroEmpresa") %>' Visible="False" Width="10px" />
                                                                <asp:TextBox ID="idSetupTextBox" runat="server" Text='<%# Bind("idSetup") %>' 
                                                                    Visible="False" Width="10px" />
                                                            </td>
                                                            <td>
                                                                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                                                                    CommandName="Insert" CssClass="button" Text="Salvar" ToolTip="Salvar" />
                                                                <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" 
                                                                    CommandName="Cancel" CssClass="button" Text="Cancelar" ToolTip="Cancelar" />
                                                            </td>
                                                        </tr>
                                                     </table>                                                     
                                                </InsertItemTemplate>
                                                <ItemTemplate>
                                                    <table ID="Quiz" cellpadding="2" cellspacing="0" width="930px">
                                                        <tr>
                                                            <td align="right" valign="top" width="250px">
                                                                <asp:Label ID="Label2" runat="server" Text="Nota de corte:"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="corteLabel" runat="server" Text='<%# Bind("corte") %>' />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right" valign="top" width="250px">
                                                                <asp:Label ID="Label3" runat="server" 
                                                                    Text="Tempo para responder (por pergunta):"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="tempoCadaPerguntaLabel" runat="server" 
                                                                    Text='<%# Bind("tempoCadaPergunta") %>' />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right" valign="top" width="250px">
                                                                <asp:Label ID="Label4" runat="server" Text="Nível da avaliação:"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="nivelLabel" runat="server" Text='<%# Bind("nivel") %>' />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right" valign="top" width="250px">
                                                                <asp:Label ID="Label5" runat="server" Text="Título:"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="nomeQuizLabel" runat="server" CssClass="tituloEmpresa" 
                                                                    Text='<%# Bind("nomeQuiz") %>' />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right" valign="top" width="250px">
                                                                <asp:Label ID="Label6" runat="server" 
                                                                    Text="Texto que será apresentado ao candidato:"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="apresentacaoQuizLabel" runat="server" 
                                                                    Text='<%# Bind("apresentacaoQuiz") %>' />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right" valign="top" width="250px">
                                                                <asp:Label ID="Label7" runat="server" Text="Status:"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="publicarLabel" runat="server" Text='<%# Bind("publicar") %>' />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right" valign="top" width="250px">
                                                                <asp:Label ID="Label8" runat="server" Text="Data da criação:"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="dataQuizLabel" runat="server" Text='<%# Bind("dataQuiz") %>' />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right" valign="top" width="250px">
                                                                <asp:Label ID="Label9" runat="server" Text="Meta:"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="pontosLabel" runat="server" Text='<%# Bind("pontos") %>' />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <asp:Label ID="idQuizLabel" runat="server" Text='<%# Eval("idQuiz") %>' 
                                                        Visible="False" />
                                                    <asp:Label ID="idSetupLabel" runat="server" Text='<%# Bind("idSetup") %>' 
                                                        Visible="False" />
                                                    <asp:Label ID="idCadastroEmpresaLabel" runat="server" 
                                                        Text='<%# Bind("idCadastroEmpresa") %>' Visible="False" />
                                                    <asp:Label ID="idCadastroEmpresa_FilhaLabel" runat="server" 
                                                        Text='<%# Bind("idCadastroEmpresa_Filha") %>' Visible="False" />
                                                    <br />
                                                    <br />
                                                    <asp:FormView ID="FormViewPerguntaResposta" runat="server" DataKeyNames="ID" 
                                                        DataSourceID="SqlDataViewQuizRespostaFORM" Width="100%" 
                                                        ondatabound="FormViewPerguntaResposta_DataBound">
                                                        <EditItemTemplate>
                                                            <table bgcolor="#FFFFEA" cellpadding="2" cellspacing="0" width="920px">
                                                                <tr>
                                                                    <td align="right" valign="top" width="380">
                                                                        <asp:TextBox ID="idRespostaQuizTextBox" runat="server" 
                                                                            Text='<%# Bind("idRespostaQuiz") %>' Visible="False" Width="10px" />
                                                                        <asp:TextBox ID="imageTextBox" runat="server" Text='<%# Bind("image") %>' 
                                                                            Visible="False" Width="10px" />
                                                                        <asp:TextBox ID="idQuizTextBox" runat="server" Text='<%# Bind("idQuiz") %>' 
                                                                            Visible="False" Width="10px" />
                                                                        <asp:TextBox ID="idPerguntaQuizTextBox" runat="server" 
                                                                            Text='<%# Bind("idPerguntaQuiz") %>' Visible="False" Width="10px" />
                                                                        <asp:Label ID="IDLabel1" runat="server" Text='<%# Eval("ID") %>' 
                                                                            Visible="False" />
                                                                        <asp:Label ID="Label15" runat="server" CssClass="tituloEmpresa" Text="Edição"></asp:Label>
                                                                    </td>
                                                                    <td>
                                                                        &nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="right" valign="top" width="380">
                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                                                                            ControlToValidate="perguntaQuizTextBox" ErrorMessage="Pergunta é obrigatória">*</asp:RequiredFieldValidator>
                                                                        <asp:Label ID="Label10" runat="server" Text="Pergunta:"></asp:Label>
                                                                    </td>
                                                                    <td>
                                                                        <asp:TextBox ID="perguntaQuizTextBox" runat="server" 
                                                                            CssClass="InputCadFormCandidatoCV" Height="100px" 
                                                                            Text='<%# Bind("perguntaQuiz") %>' TextMode="MultiLine" Width="500px" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="right" valign="top" width="380">
                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                                                                            ControlToValidate="respostaQuizTextBox" ErrorMessage="Resposta é obrigatória">*</asp:RequiredFieldValidator>
                                                                        <asp:Label ID="Label11" runat="server" Text="Resposta:"></asp:Label>
                                                                    </td>
                                                                    <td>
                                                                        <asp:TextBox ID="respostaQuizTextBox" runat="server" 
                                                                            CssClass="InputCadFormCandidatoCV" Height="150px" 
                                                                            Text='<%# Bind("respostaQuiz") %>' TextMode="MultiLine" Width="500px" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="right" valign="top" width="380">
                                                                        <asp:Label ID="Label14" runat="server" Text="Esta resposta é a correta?"></asp:Label>
                                                                    </td>
                                                                    <td>
                                                                        <asp:CheckBox ID="corretaCheckBox" runat="server" 
                                                                            Checked='<%# Bind("correta") %>' Text="Esta é a resposta correta!" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="right" valign="top" width="380">
                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                                                            ControlToValidate="pontoTextBox" ErrorMessage="Pontos é obrigatório">*</asp:RequiredFieldValidator>
                                                                        <asp:Label ID="Label12" runat="server" 
                                                                            Text="Se esta resposta for a correta, quantos pontos ela vale?"></asp:Label>
                                                                    </td>
                                                                    <td>
                                                                        <asp:TextBox ID="pontoTextBox" runat="server" 
                                                                            CssClass="InputCadFormCandidatoCV" Text='<%# Bind("ponto") %>' Width="80px" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="right" valign="top" width="380">
                                                                        <asp:Label ID="Label13" runat="server" Text="Apresentar:"></asp:Label>
                                                                    </td>
                                                                    <td>
                                                                        <asp:RadioButtonList ID="RadioButtonList1" runat="server" 
                                                                            RepeatDirection="Horizontal" SelectedValue='<%# Bind("apresenta") %>'>
                                                                            <asp:ListItem Value="0">Não</asp:ListItem>
                                                                            <asp:ListItem Value="1">Sim</asp:ListItem>
                                                                        </asp:RadioButtonList>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="right" valign="top" width="380">
                                                                        &nbsp;</td>
                                                                    <td>
                                                                        <asp:ValidationSummary ID="ValidationSummary2" runat="server" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="right" valign="top" width="380">
                                                                        &nbsp;</td>
                                                                    <td>
                                                                        <asp:LinkButton ID="EditButton" runat="server" CommandName="Update" 
                                                                            CssClass="button" Text="Salvar" ToolTip="Salvar alterações" />
                                                                        <asp:LinkButton ID="LinkButtonFecharForm" runat="server" 
                                                                            CausesValidation="False" CommandName="Cancel" CssClass="button" 
                                                                            ToolTip="Fechar">Fechar</asp:LinkButton>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </EditItemTemplate>
                                                        <EmptyDataTemplate>
                                                            <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                                                                CommandName="New" CssClass="button" >Incluir uma nova pergunta e resposta</asp:LinkButton>
                                                        </EmptyDataTemplate>
                                                        <InsertItemTemplate>
                                                            <table bgcolor="#FFFFEA" cellpadding="2" cellspacing="0" width="920px">
                                                                <tr>
                                                                    <td align="right" valign="top" width="380">
                                                                        <asp:TextBox ID="idRespostaQuizTextBox" runat="server" 
                                                                            Text='<%# Bind("idRespostaQuiz") %>' Visible="False" Width="10px" />
                                                                        <asp:TextBox ID="imageTextBox" runat="server" Text='<%# Bind("image") %>' 
                                                                            Visible="False" Width="10px" />
                                                                        <asp:TextBox ID="idQuizTextBox" runat="server" Text='<%# Bind("idQuiz") %>' 
                                                                            Visible="False" Width="10px" />
                                                                        <asp:TextBox ID="idPerguntaQuizTextBox" runat="server" 
                                                                            Text='<%# Bind("idPerguntaQuiz") %>' Visible="False" Width="10px" />
                                                                        <asp:Label ID="IDLabel1" runat="server" Text='<%# Eval("ID") %>' 
                                                                            Visible="False" />
                                                                        <asp:Label ID="Label15" runat="server" CssClass="tituloEmpresa" Text="Edição"></asp:Label>
                                                                    </td>
                                                                    <td>
                                                                        &nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="right" valign="top" width="380">
                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorP" runat="server" 
                                                                            ControlToValidate="perguntaQuizTextBoxI" 
                                                                            ErrorMessage="Pergunta é obrigatória">*</asp:RequiredFieldValidator>
                                                                        <asp:Label ID="Label10" runat="server" Text="Pergunta:"></asp:Label>
                                                                    </td>
                                                                    <td>
                                                                        <asp:TextBox ID="perguntaQuizTextBoxI" runat="server" 
                                                                            CssClass="InputCadFormCandidatoCV" Height="100px" 
                                                                            Text='<%# Bind("perguntaQuiz") %>' TextMode="MultiLine" Width="500px" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="right" valign="top" width="380">
                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                                                                            ControlToValidate="respostaQuizTextBox" ErrorMessage="Resposta é obrigatória">*</asp:RequiredFieldValidator>
                                                                        <asp:Label ID="Label11" runat="server" Text="Resposta:"></asp:Label>
                                                                    </td>
                                                                    <td>
                                                                        <asp:TextBox ID="respostaQuizTextBox" runat="server" 
                                                                            CssClass="InputCadFormCandidatoCV" Height="150px" 
                                                                            Text='<%# Bind("respostaQuiz") %>' TextMode="MultiLine" Width="500px" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="right" valign="top" width="380">
                                                                        <asp:Label ID="Label14" runat="server" Text="Esta resposta é a correta?"></asp:Label>
                                                                    </td>
                                                                    <td>
                                                                        <asp:CheckBox ID="corretaCheckBox" runat="server" 
                                                                            Checked='<%# Bind("correta") %>' Text="Esta é a resposta correta!" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="right" valign="top" width="380">
                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                                                            ControlToValidate="pontoTextBox" ErrorMessage="Pontos é obrigatório">*</asp:RequiredFieldValidator>
                                                                        <asp:Label ID="Label12" runat="server" 
                                                                            Text="Se esta resposta for a correta, quantos pontos ela vale?"></asp:Label>
                                                                    </td>
                                                                    <td>
                                                                        <asp:TextBox ID="pontoTextBox" runat="server" 
                                                                            CssClass="InputCadFormCandidatoCV" Text='<%# Bind("ponto") %>' Width="80px" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="right" valign="top" width="380">
                                                                        <asp:Label ID="Label13" runat="server" Text="Apresentar:"></asp:Label>
                                                                    </td>
                                                                    <td>
                                                                        <asp:RadioButtonList ID="RadioButtonList1" runat="server" 
                                                                            RepeatDirection="Horizontal" SelectedValue='<%# Bind("apresenta") %>'>
                                                                            <asp:ListItem Value="0">Não</asp:ListItem>
                                                                            <asp:ListItem Value="1" Selected="True">Sim</asp:ListItem>
                                                                        </asp:RadioButtonList>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="right" valign="top" width="380">
                                                                        &nbsp;</td>
                                                                    <td>
                                                                        <asp:ValidationSummary ID="ValidationSummary2" runat="server" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="right" valign="top" width="380">
                                                                        &nbsp;</td>
                                                                    <td>
                                                                        <asp:LinkButton ID="EditButton" runat="server" CommandName="Insert" 
                                                                            CssClass="button" Text="Salvar" ToolTip="Salvar alterações" />
                                                                        <asp:LinkButton ID="LinkButtonFecharForm" runat="server" 
                                                                            CausesValidation="False" CommandName="Cancel" CssClass="button" 
                                                                            ToolTip="Fechar">Fechar</asp:LinkButton>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </InsertItemTemplate>
                                                        <ItemTemplate>
                                                            <table bgcolor="#FFFFEA" cellpadding="2" cellspacing="0" width="920px">
                                                                <tr>
                                                                    <td align="right" width="380">
                                                                        <asp:Label ID="Label15" runat="server" CssClass="tituloEmpresa" 
                                                                            Text="Item selecionado para edição"></asp:Label>
                                                                    </td>
                                                                    <td>
                                                                        &nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="right" width="380">
                                                                        <asp:Label ID="Label10" runat="server" Text="Pergunta:"></asp:Label>
                                                                    </td>
                                                                    <td>
                                                                        <asp:Label ID="perguntaQuizLabel" runat="server" 
                                                                            Text='<%# Bind("perguntaQuiz") %>' />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="right" width="380">
                                                                        <asp:Label ID="Label11" runat="server" Text="Resposta:"></asp:Label>
                                                                    </td>
                                                                    <td>
                                                                        <asp:Label ID="respostaQuizLabel" runat="server" 
                                                                            Text='<%# Bind("respostaQuiz") %>' />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="right" width="380">
                                                                        <asp:Label ID="Label14" runat="server" Text="Esta resposta é a correta?"></asp:Label>
                                                                    </td>
                                                                    <td>
                                                                        <asp:CheckBox ID="corretaCheckBox" runat="server" 
                                                                            Checked='<%# Bind("correta") %>' Enabled="false" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="right" width="380">
                                                                        <asp:Label ID="Label12" runat="server" Text="Pontos:"></asp:Label>
                                                                    </td>
                                                                    <td>
                                                                        <asp:Label ID="pontoLabel" runat="server" Text='<%# Bind("ponto") %>' />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="right" width="380">
                                                                        <asp:Label ID="Label13" runat="server" Text="Apresentar:"></asp:Label>
                                                                    </td>
                                                                    <td>
                                                                        <asp:RadioButtonList ID="RadioButtonList1" runat="server" Enabled="False" 
                                                                            RepeatDirection="Horizontal" SelectedValue='<%# Bind("apresenta") %>'>
                                                                            <asp:ListItem Value="0">Não</asp:ListItem>
                                                                            <asp:ListItem Value="1">Sim</asp:ListItem>
                                                                        </asp:RadioButtonList>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="right" width="380">
                                                                        &nbsp;</td>
                                                                    <td>
                                                                        &nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="right" width="380">
                                                                        &nbsp;</td>
                                                                    <td>
                                                                        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                                                                            CommandName="Edit" CssClass="button" Text="Editar" ToolTip="Editar" />
                                                                        <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                                                                            CommandName="New" CssClass="button" Text="Incluir uma resposta" 
                                                                            ToolTip="Incluir uma resposta" />
                                                                        <asp:LinkButton ID="LinkButtonExcluir" runat="server" CausesValidation="False" CssClass="button" 
                                                                            onclientclick="return confirm(&quot;Quer excluir esta resposta?&quot;)" 
                                                                            ToolTip="Clique aqui para excluir esta resposta" 
                                                                            onclick="LinkButtonExcluir_Click">Excluir</asp:LinkButton>
                                                                        <asp:LinkButton ID="LinkButtonFecharForm" runat="server" CssClass="button" 
                                                                            onclick="LinkButtonFecharForm_Click" ToolTip="Fechar">Fechar</asp:LinkButton>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' 
                                                                Visible="False" />
                                                            <asp:Label ID="idPerguntaQuizLabel" runat="server" 
                                                                Text='<%# Bind("idPerguntaQuiz") %>' Visible="False" />
                                                            <asp:Label ID="idQuizLabel" runat="server" Text='<%# Bind("idQuiz") %>' 
                                                                Visible="False" />
                                                            <asp:Label ID="imageLabel" runat="server" Text='<%# Bind("image") %>' 
                                                                Visible="False" />
                                                            <asp:Label ID="idRespostaQuizLabel" runat="server" 
                                                                Text='<%# Bind("idRespostaQuiz") %>' Visible="False" />
                                                            <br />
                                                            <br />
                                                            <br />
                                                            &nbsp;
                                                        </ItemTemplate> 
                                                    </asp:FormView>
                                                    <br />
                                                    <asp:GridView ID="GridViewPergunta" runat="server" AutoGenerateColumns="False" 
                                                        DataKeyNames="idPerguntaQuiz,idRespostaQuiz" DataSourceID="SqlPergunta" 
                                                        GridLines="None" Width="100%" 
                                                        onselectedindexchanged="GridViewPergunta_SelectedIndexChanged" 
                                                        onrowdatabound="GridViewPergunta_RowDataBound">
                                                        <AlternatingRowStyle BackColor="#F2F2F2" BorderColor="#CCCCCC" 
                                                            BorderStyle="Dotted" BorderWidth="1px" />
                                                        <Columns>
                                                            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                                                                ReadOnly="True" SortExpression="ID" Visible="False" />
                                                            <asp:BoundField DataField="idPerguntaQuiz" HeaderText="idPerguntaQuiz" 
                                                                SortExpression="idPerguntaQuiz" Visible="False" />
                                                            <asp:BoundField DataField="idQuiz" HeaderText="idQuiz" SortExpression="idQuiz" 
                                                                Visible="False" />
                                                            <asp:TemplateField HeaderText="Pergunta formulada" 
                                                                SortExpression="perguntaQuiz">
                                                                <EditItemTemplate>
                                                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("perguntaQuiz") %>'></asp:TextBox>
                                                                </EditItemTemplate>
                                                                <ItemTemplate>
                                                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("perguntaQuiz") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <HeaderStyle HorizontalAlign="Left" Width="350px" Wrap="True" />
                                                                <ItemStyle VerticalAlign="Top" />
                                                            </asp:TemplateField>
                                                            <asp:BoundField DataField="image" HeaderText="image" SortExpression="image" 
                                                                Visible="False" />
                                                            <asp:BoundField DataField="apresenta" HeaderText="apresenta" 
                                                                SortExpression="apresenta" Visible="False" />
                                                            <asp:TemplateField HeaderText="Respostas possíveis" ShowHeader="False">
                                                                <ItemTemplate>
                                                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="false" 
                                                                        CommandName="Select" Text='<%# Eval("respostaQuiz") %>' 
                                                                        
                                                                        ToolTip="Clique aqui para editar esta pergunta e resposta ou incluir uma nova resposta"></asp:LinkButton>
                                                                </ItemTemplate>
                                                                <HeaderStyle HorizontalAlign="Left" />
                                                            </asp:TemplateField>
                                                            <asp:BoundField DataField="respostaQuiz" HeaderText="Respostas possíveis" 
                                                                SortExpression="respostaQuiz" Visible="False">
                                                            <HeaderStyle HorizontalAlign="Left" />
                                                            <ItemStyle VerticalAlign="Top" />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="ponto" HeaderText="Ponto no acerto" 
                                                                SortExpression="ponto">
                                                            <HeaderStyle HorizontalAlign="Left" />
                                                            <ItemStyle VerticalAlign="Top" />
                                                            </asp:BoundField>
                                                            <asp:CheckBoxField DataField="correta" HeaderText="Correta" 
                                                                SortExpression="correta">
                                                            <ItemStyle VerticalAlign="Top" />
                                                            </asp:CheckBoxField>
                                                            <asp:BoundField DataField="idRespostaQuiz" HeaderText="idRespostaQuiz" 
                                                                SortExpression="idRespostaQuiz" Visible="False" />
                                                        </Columns>
                                                    </asp:GridView>
                                                    <br />
                                                    <asp:SqlDataSource ID="SqlPergunta" runat="server" 
                                                        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                                                        SelectCommand="_USP_QUIZ_EMPRESA_PERGUNTAS" SelectCommandType="StoredProcedure">
                                                        <SelectParameters>
                                                            <asp:ControlParameter ControlID="idQuizLabel" Name="idQuiz" PropertyName="Text" 
                                                                Type="Int32" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>
                                                    <asp:SqlDataSource ID="SqlDataViewQuizRespostaFORM" runat="server" 
                                                        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                                                        InsertCommand="_USP_QUIZ_EMPRESA_INSERT_PERGUNTAS" 
                                                        InsertCommandType="StoredProcedure" 
                                                        oninserted="SqlDataViewQuizRespostaFORM_Inserted" 
                                                        oninserting="SqlDataViewQuizRespostaFORM_Inserting" 
                                                        onupdated="SqlDataViewQuizRespostaFORM_Updated" 
                                                        SelectCommand="_USP_QUIZ_EMPRESA_INSERT_PERGUNTAS" 
                                                        SelectCommandType="StoredProcedure" 
                                                        UpdateCommand="_USP_QUIZ_EMPRESA_INSERT_PERGUNTAS" 
                                                        UpdateCommandType="StoredProcedure">
                                                        <InsertParameters>
                                                            <asp:Parameter Name="idQuiz" Type="Int32" />
                                                            <asp:Parameter Name="idPerguntaQuiz" Type="Int32" />
                                                            <asp:Parameter Name="perguntaQuiz" Type="String" />
                                                            <asp:Parameter Name="image" Type="String" />
                                                            <asp:Parameter Name="respostaQuiz" Type="String" />
                                                            <asp:Parameter Name="ponto" Type="Int32" />
                                                            <asp:Parameter Name="correta" Type="Int32" />
                                                            <asp:Parameter Name="idRespostaQuiz" Type="Int32" />
                                                            <asp:Parameter Name="apresenta" Type="Int32" />
                                                            <asp:Parameter Name="ID" Type="Int32" />
                                                            <asp:Parameter Name="DELETE" Type="Int32" />
                                                        </InsertParameters>
                                                        <SelectParameters>
                                                            <asp:ControlParameter ControlID="idQuizLabel" Name="idQuiz" PropertyName="Text" 
                                                                Type="Int32" />
                                                            <asp:ControlParameter ControlID="idPerguntaQuizLabel" Name="idPerguntaQuiz" 
                                                                PropertyName="Text" Type="Int32" />
                                                            <asp:Parameter DefaultValue="0" Name="perguntaQuiz" Type="String" />
                                                            <asp:Parameter DefaultValue="0" Name="image" Type="String" />
                                                            <asp:Parameter DefaultValue="0" Name="respostaQuiz" Type="String" />
                                                            <asp:Parameter DefaultValue="0" Name="ponto" Type="Int32" />
                                                            <asp:Parameter DefaultValue="0" Name="correta" Type="Int32" />
                                                            <asp:ControlParameter ControlID="idRespostaQuizLabel" Name="idRespostaQuiz" 
                                                                PropertyName="Text" Type="Int32" />
                                                            <asp:Parameter Name="apresenta" Type="Int32" DefaultValue="0" />
                                                            <asp:Parameter Name="ID" Type="Int32" DefaultValue="0" />
                                                            <asp:Parameter DefaultValue="0" Name="DELETE" Type="Int32" />
                                                        </SelectParameters>
                                                        <UpdateParameters>
                                                            <asp:Parameter Name="idQuiz" Type="Int32" />
                                                            <asp:Parameter Name="idPerguntaQuiz" Type="Int32" />
                                                            <asp:Parameter Name="perguntaQuiz" Type="String" />
                                                            <asp:Parameter Name="image" Type="String" />
                                                            <asp:Parameter Name="respostaQuiz" Type="String" />
                                                            <asp:Parameter Name="ponto" Type="Int32" />
                                                            <asp:Parameter Name="correta" Type="Int32" />
                                                            <asp:Parameter Name="idRespostaQuiz" Type="Int32" />
                                                            <asp:Parameter Name="apresenta" Type="Int32" />
                                                            <asp:Parameter Name="ID" Type="Int32" />
                                                            <asp:Parameter Name="DELETE" Type="Int32" />
                                                        </UpdateParameters>
                                                    </asp:SqlDataSource>
                                                    <br />
                                                    <br />
                                                    <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                                                        CommandName="Edit" CssClass="button" Text="Editar avaliação" 
                                                        ToolTip="Clique aqui para editar as métricas da avaliação" />
                                                    <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                                                        CommandName="Delete" CssClass="button" 
                                                        onclientclick="return confirm(&quot;Atenção:\nQuer excluir esta avaliação?&quot;)" 
                                                        Text="Excluir avaliação" 
                                                        ToolTip="Clique aqui para excluir esta avaliação" />
                                                    <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                                                        CommandName="New" CssClass="button" Text="Incluir nova avaliação" 
                                                        ToolTip="Clique aqui para incluir uma nova avaliação" />
                                                    <asp:LinkButton ID="LinkButtonFechar" runat="server" CssClass="button" 
                                                        onclick="LinkButtonFechar_Click" ToolTip="Fechar">Fechar</asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:FormView>
                                            <br />
                                            <asp:SqlDataSource ID="SqlDataViewQuiz" runat="server" 
                                                ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                                                SelectCommand="_USP_QUIZ_EMPRESA" SelectCommandType="StoredProcedure">
                                                <SelectParameters>
                                                    <asp:SessionParameter Name="idCadastroEmpresa" SessionField="idCadastroEmpresa" 
                                                        Type="Int32" />
                                                    <asp:SessionParameter Name="idSetup" SessionField="idSetup" Type="Int32" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                            <asp:SqlDataSource ID="SqlDataViewQuizFORM" runat="server" 
                                                ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                                                DeleteCommand="DELETE FROM [tbQuiz] WHERE [idQuiz] = @idQuiz" 
                                                InsertCommand="INSERT INTO [tbQuiz] ([idSetup], [idCadastroEmpresa], [idCadastroEmpresa_Filha], [corte], [tempoCadaPergunta], [nivel], [nomeQuiz], [apresentacaoQuiz], [publicar], [dataQuiz], [pontos]) VALUES (@idSetup, @idCadastroEmpresa, @idCadastroEmpresa_Filha, @corte, @tempoCadaPergunta, @nivel, @nomeQuiz, @apresentacaoQuiz, @publicar, @dataQuiz, @pontos)" 
                                                SelectCommand="SELECT [idQuiz], [idSetup], [idCadastroEmpresa], [idCadastroEmpresa_Filha], [corte], [tempoCadaPergunta], [nivel], [nomeQuiz], [apresentacaoQuiz], [publicar], [dataQuiz], [pontos] FROM [tbQuiz] WHERE ([idQuiz] = @idQuiz)" 
                                                UpdateCommand="UPDATE [tbQuiz] SET [idSetup] = @idSetup, [idCadastroEmpresa] = @idCadastroEmpresa, [idCadastroEmpresa_Filha] = @idCadastroEmpresa_Filha, [corte] = @corte, [tempoCadaPergunta] = @tempoCadaPergunta, [nivel] = @nivel, [nomeQuiz] = @nomeQuiz, [apresentacaoQuiz] = @apresentacaoQuiz, [publicar] = @publicar, [dataQuiz] = @dataQuiz, [pontos] = @pontos WHERE [idQuiz] = @idQuiz">
                                                <DeleteParameters>
                                                    <asp:Parameter Name="idQuiz" Type="Int32" />
                                                </DeleteParameters>
                                                <InsertParameters>
                                                    <asp:Parameter Name="idSetup" Type="Int32" />
                                                    <asp:Parameter Name="idCadastroEmpresa" Type="Int32" />
                                                    <asp:Parameter Name="idCadastroEmpresa_Filha" Type="Int32" />
                                                    <asp:Parameter Name="corte" Type="Int32" />
                                                    <asp:Parameter Name="tempoCadaPergunta" Type="Int32" />
                                                    <asp:Parameter Name="nivel" Type="String" />
                                                    <asp:Parameter Name="nomeQuiz" Type="String" />
                                                    <asp:Parameter Name="apresentacaoQuiz" Type="String" />
                                                    <asp:Parameter Name="publicar" Type="Int32" />
                                                    <asp:Parameter Name="dataQuiz" Type="DateTime" />
                                                    <asp:Parameter Name="pontos" Type="Int32" />
                                                </InsertParameters>
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="idQuizLabel" Name="idQuiz" PropertyName="Text" 
                                                        Type="Int32" />
                                                </SelectParameters>
                                                <UpdateParameters>
                                                    <asp:Parameter Name="idSetup" Type="Int32" />
                                                    <asp:Parameter Name="idCadastroEmpresa" Type="Int32" />
                                                    <asp:Parameter Name="idCadastroEmpresa_Filha" Type="Int32" />
                                                    <asp:Parameter Name="corte" Type="Int32" />
                                                    <asp:Parameter Name="tempoCadaPergunta" Type="Int32" />
                                                    <asp:Parameter Name="nivel" Type="String" />
                                                    <asp:Parameter Name="nomeQuiz" Type="String" />
                                                    <asp:Parameter Name="apresentacaoQuiz" Type="String" />
                                                    <asp:Parameter Name="publicar" Type="Int32" />
                                                    <asp:Parameter Name="dataQuiz" Type="DateTime" />
                                                    <asp:Parameter Name="pontos" Type="Int32" />
                                                    <asp:Parameter Name="idQuiz" Type="Int32" />
                                                </UpdateParameters>
                                            </asp:SqlDataSource>
                                        </td>
                                    </tr>
                                </table> 
                        </td>
                    </tr>
                </table>
</asp:Content>

