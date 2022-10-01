<%@ Page Title="" Language="VB" MasterPageFile="~/_corporativo/corporativoPage.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="false" CodeFile="agenda.aspx.vb" Inherits="_corporativo_relatorio" %>

<%@ Register assembly="DayPilot" namespace="DayPilot.Web.Ui" tagprefix="DayPilot" %>

<%@ Register assembly="JaxterChat" namespace="WebFurbish" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
    .alinhamento {float:left;}
</style>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type="text/javascript">
        google.load("visualization", "1", { packages: ["corechart"] });
        google.setOnLoadCallback(drawChart);
        function drawChart() {
            var data = google.visualization.arrayToDataTable(<%=parametroLabel.Text%>);

            var options = {
                title: 'Resultado da entrevista presencial'
                , backgroundColor: 'transparent', fontSize: '9'
            };

            var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
            chart.draw(data, options);
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <%-- <script type="text/javascript">
        $(function () {
            $("#<%=PanelEMAIL.ClientID%>").dialog
            (
            {
                closeText: '', width: '700', title: "<%=CabecPanelLabel.Text%>", position: "top", show:
                { effect: 'drop', direction: "up" }, hide: { effect: 'drop', direction: "up" }
            }
            );
        });
	</script>--%>
    <script type="text/javascript">
        $(function () {
            $("#<%=PanelAviso.ClientID%>").dialog({ closeText: '', width: '500', title: "Aviso", height: '100', position: "top", show: { effect: 'drop', direction: "up" }, hide: { effect: 'drop', direction: "up"} });
        });
	</script>

    <script type="text/javascript">
            $(function () {
                $("#<%=PanelHISTORICO.ClientID%>").dialog
            ({ closeText: '', width: '850', title: "Histórico da entrevista virtual", position: "top", show: { effect: 'drop', direction: "up" }, hide: { effect: 'drop', direction: "up"} });
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
        <table cellpadding="0" cellspacing="0" align="center" 
            width="100%">
            <tr>
                <td>
                    <br />
                                                                        <asp:Label ID="idQuizLabel" runat="server" Visible="False"></asp:Label>
                                                                        <asp:Label ID="parametroLabel" runat="server" Visible="False"></asp:Label>
                                                                        <asp:Label ID="idRH_GestorLabel" runat="server" Visible="False"></asp:Label>
                                                                        <asp:Label ID="idUserLabel" runat="server" Visible="False"></asp:Label>
                                                                        <asp:Label ID="idQuizCandidatoLabel" runat="server" Visible="False"></asp:Label>
                                                                        <asp:Label ID="finalizadoLabel" runat="server" Visible="False"></asp:Label>
                                                                        <asp:Label ID="idProcessoSeletivoLabel" runat="server" Visible="False"></asp:Label>
                                                                        <asp:Label ID="idFaseProcessoSeletivoLabel" runat="server" Visible="False"></asp:Label>
                                                                        <asp:Label ID="idCurriculoLabel" runat="server" Visible="False"></asp:Label>
                                                                        <asp:Label ID="CabecPanelLabel" runat="server" Visible="False"></asp:Label>
                                                                        <asp:Label ID="dsProcessoLabel" runat="server" Visible="False"></asp:Label>
                                                                        <asp:Label ID="nomeQuizLabel" runat="server" Visible="False"></asp:Label>
                    <asp:Label ID="nomeConsultorLabel" runat="server" Visible="False"></asp:Label>
                    <asp:Label ID="nomeCandidatoLabel" runat="server" Visible="False"></asp:Label>
                    <asp:Label ID="dsFaseLabel" runat="server" Visible="False"></asp:Label>
                    <asp:Label ID="idPerguntaQuizAVALIACAOLabel" runat="server" Visible="False"></asp:Label>
                    <asp:Label ID="RadioButtonListAVALIACAOLabel" runat="server" Visible="False"></asp:Label>
                    <asp:Label ID="campoLaudoLabel" runat="server"></asp:Label>
                    <br />
                    <table id="NAVEGADOR1" align="center" bgcolor="#F3F3F3" cellpadding="0" 
                                    cellspacing="0" width="930px">
                        <tr>
                            <td>
                                <table cellpadding="0" cellspacing="0" id="NAVEGADOR2">
                                    <tr>
                                        <td>
                                            <asp:Label ID="PPLabelNomeEmpresa" runat="server" 
                                                            CssClass="bannerNavegadorInternoNomeEmpresa" 
                                                Text="Links relacionados à Agenda:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Image ID="Image1" runat="server" 
                                                            ImageUrl="~/_corporativo/images/holomatica/navegadorIndicador.png" />
                                        </td>
                                        <td>
                                            <asp:LinkButton ID="LinkButtonCOMPROMISSO" runat="server" CssClass="textoNone" 
                                                PostBackUrl="agenda.aspx?InfoAGENDA=1&Info=45" 
                                                ToolTip="Entrevistas Presenciais">Entrevistas Presenciais</asp:LinkButton>
                                        </td>
                                        <td>
                                            <asp:Label ID="separadorLabel5" runat="server" Text="&nbsp;&nbsp;|&nbsp;&nbsp;"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:LinkButton ID="LinkButtonVIRTUAL" runat="server" CssClass="textoNone" 
                                                PostBackUrl="agenda.aspx?InfoAGENDA=2&Info=45" 
                                                ToolTip="Entrevistas  Virtuais">Entrevistas Virtuais</asp:LinkButton>
                                        </td>
                                        <td>
                                            <asp:Label ID="separadorLabel6" runat="server" Text="&nbsp;&nbsp;|&nbsp;&nbsp;"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:LinkButton ID="LinkButtonAVALIACAO" runat="server" CssClass="textoNone" 
                                                PostBackUrl="agenda.aspx?InfoAGENDA=3&amp;Info=45" 
                                                ToolTip="Clique aqui para acompanhar as avaliações enviadas aos candidatos">Resultado das avaliações </asp:LinkButton>
                                        </td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                    <br />
                <table runat="server" visible="true" cellpadding="0" cellspacing="0" 
                        id="BodyInternoAGENDA" width="930px" align="center">
                    <tr>
                        <td align="left">
                            <br />
                            <asp:Image ID="ImageLinha0" runat="server" ImageUrl="~/_corporativo/images/holomatica/linha.png" />
                            <asp:Label ID="LabelPesquisadosProcessosSeletivos" runat="server" CssClass="h1" 
                                Text="Entrevistas Presenciais  "></asp:Label>
                            <asp:Label ID="naDataLabel" runat="server" CssClass="h1"></asp:Label>
                            <asp:Label ID="idEntrevistaPresencialLabel" runat="server" Visible="False"></asp:Label>
                            <asp:Label ID="inicioLabel" runat="server" Visible="False"></asp:Label>
                            <br />
                            <table id="AGENDA" align="center" cellpadding="2" cellspacing="2" width="800px">
                                <tr>
                                    <td align="right" valign="top" width="50px">
                                        &nbsp;</td>
                                    <td width="700px">

                                        <asp:Panel ID="PanelFORM" runat="server" Visible="False">
                                            <asp:Panel ID="PanelFINALIZADO" runat="server" Visible="False">
                                                <br />
                                                <table ID="NAV0" cellpadding="0" cellspacing="0" width="100%">
                                                    <tr>
                                                        <td align="right">
                                                            <asp:LinkButton ID="LinkButtonFECHARRESULTADO" runat="server" CssClass="button">Fechar</asp:LinkButton>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <asp:Label ID="LabelFinalizado" runat="server" CssClass="textQUIZ" 
                                                    Text="Entrevista Finalizada!"></asp:Label>
                                                <br />
                                                <br />
                                                <div ID="chart_div" style="width: 500; height: 300px;">
                                                </div>
                                                <asp:GridView ID="GridViewRESULTADO" runat="server" AutoGenerateColumns="False" 
                                                    BorderStyle="None" DataSourceID="SqlRESULTADOENTREVISTAPRESENCIAL" 
                                                    GridLines="Horizontal" Width="100%">
                                                    <AlternatingRowStyle BackColor="#F7F7F7" />
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="Pontos" SortExpression="Total">
                                                            <EditItemTemplate>
                                                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Total") %>'></asp:TextBox>
                                                            </EditItemTemplate>
                                                            <ItemTemplate>
                                                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Total") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Avaliação" SortExpression="respostaQuiz">
                                                            <EditItemTemplate>
                                                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("respostaQuiz") %>'></asp:TextBox>
                                                            </EditItemTemplate>
                                                            <ItemTemplate>
                                                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("respostaQuiz") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Tema" SortExpression="perguntaQuiz">
                                                            <EditItemTemplate>
                                                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("perguntaQuiz") %>'></asp:TextBox>
                                                            </EditItemTemplate>
                                                            <ItemTemplate>
                                                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("perguntaQuiz") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Sua Avaliação" SortExpression="avaliacao">
                                                            <EditItemTemplate>
                                                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("avaliacao") %>'></asp:TextBox>
                                                            </EditItemTemplate>
                                                            <ItemTemplate>
                                                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("avaliacao") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                </asp:GridView>
                                                <br />
                                                <asp:SqlDataSource ID="SqlRESULTADOENTREVISTAPRESENCIAL" runat="server" 
                                                    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                                                    SelectCommand="_USP_ENTREVISTA_PRESENCIAL_RESULTADO" 
                                                    SelectCommandType="StoredProcedure">
                                                    <SelectParameters>
                                                        <asp:SessionParameter Name="idSetup" SessionField="idSetup" Type="Int32" />
                                                        <asp:ControlParameter ControlID="idCurriculoLabel" Name="idcurriculo" 
                                                            PropertyName="Text" Type="Int32" />
                                                        <asp:ControlParameter ControlID="idQuizLabel" Name="idQuiz" PropertyName="Text" 
                                                            Type="Int32" />
                                                        <asp:ControlParameter ControlID="idProcessoSeletivoLabel" 
                                                            Name="idProcessoSeletivo" PropertyName="Text" Type="Int32" />
                                                        <asp:ControlParameter ControlID="idFaseProcessoSeletivoLabel" 
                                                            Name="idFaseProcessoSeletivo" PropertyName="Text" Type="Int32" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                            </asp:Panel>
                                            <asp:Panel ID="PanelFormEntrevista" runat="server" BackColor="White" 
                                                Visible="False">
                                                <table cellpadding="10" cellspacing="10" width="100%">
                                                    <tr>
                                                        <td>
                                                            <table ID="NAV" cellpadding="0" cellspacing="0" width="100%">
                                                                <tr>
                                                                    <td align="right">
                                                                        <asp:LinkButton ID="LinkButtonFECHARFORM" runat="server" CssClass="button">Fechar</asp:LinkButton>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <br />
                                                            <asp:DataList ID="DataListAPRESENTACAO" runat="server" DataKeyField="ID" 
                                                                DataSourceID="SqlFORMENTREVISTA_TITULO">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="nomeQuizLabel" runat="server" CssClass="tituloEmpresa" 
                                                                        Text='<%# Eval("nomeQuiz") %>' />
                                                                    <br />
                                                                    <asp:Label ID="respostaQuizLabel" runat="server" 
                                                                        Text='<%# Eval("apresentacaoQuiz") %>' />
                                                                    <br />
                                                                </ItemTemplate>
                                                            </asp:DataList>
                                                            <br />
                                                            <table ID="MONTAAVALIACAO" cellpadding="2" cellspacing="2" width="100%">
                                                                <tr>
                                                                    <td>
                                                                        <asp:DataList ID="DataListSTEP" runat="server" DataKeyField="ID" 
                                                                            DataSourceID="SqlFORMENTREVISTA_PERGUNTA_STEP" Width="100%">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' 
                                                                                    Visible="False" />
                                                                                <asp:Label ID="idcurriculoLabel" runat="server" 
                                                                                    Text='<%# Eval("idcurriculo") %>' Visible="False" />
                                                                                <asp:Label ID="finalizadoLabel" runat="server" Text='<%# Eval("finalizado") %>' 
                                                                                    Visible="False"></asp:Label>
                                                                                <asp:Label ID="idPerguntaQuizLabel" runat="server" 
                                                                                    Text='<%# Eval("idPerguntaQuiz") %>' Visible="False" />
                                                                                <asp:Label ID="idQuizLabel" runat="server" Text='<%# Eval("idQuiz") %>' 
                                                                                    Visible="False" />
                                                                                <asp:Label ID="idCadastroEmpresaLabel" runat="server" 
                                                                                    Text='<%# Eval("idCadastroEmpresa") %>' Visible="False" />
                                                                                <asp:Label ID="idSetupLabel" runat="server" Text='<%# Eval("idSetup") %>' 
                                                                                    Visible="False" />
                                                                                <asp:Label ID="campoLaudoLabel" runat="server" Text='<%# Eval("campoLaudo") %>' Visible="False"></asp:Label>
                                                                                <br />
                                                                                <asp:Label ID="perguntaQuizLabel" runat="server" CssClass="textQUIZ" 
                                                                                    Text='<%# Eval("perguntaQuiz") %>' />
                                                                                <br />
                                                                                <asp:Label ID="mensagemLabel" runat="server" CssClass="textBold" 
                                                                                    Text='<%# Eval("mensagem") %>'></asp:Label>
                                                                                <br />
                                                                            </ItemTemplate>
                                                                        </asp:DataList>
                                                                        <asp:TextBox ID="AvaliacaoTextBox" runat="server" 
                                                                            CssClass="InputCadFormCandidatoCV" Height="85px" TextMode="MultiLine" 
                                                                            Width="100%"></asp:TextBox>
                                                                        <asp:RadioButtonList ID="RadioButtonListAVALIACAO" runat="server" 
                                                                            AutoPostBack="True" CssClass="InputCadFormCandidatoCV" 
                                                                            DataSourceID="SqlFORMENTREVISTA_MONTA_PERGUNTA_STEP" 
                                                                            DataTextField="respostaQuiz" DataValueField="idRespostaQuiz" 
                                                                            RepeatDirection="Horizontal" Width="100%">
                                                                        </asp:RadioButtonList>
                                                                        <br />
                                                                        <asp:LinkButton ID="LinkButtonSalvaAvaliacao" runat="server" CssClass="button" 
                                                                            ToolTip="Clique aqui para salvar e abrir o próximo item da avaliação">Próximo item da avaliação</asp:LinkButton>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <br />
                                                            <asp:SqlDataSource ID="SqlFORMENTREVISTA_TITULO" runat="server" 
                                                                ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                                                                SelectCommand="_USP_ENTREVISTA_PRESENCIAL" SelectCommandType="StoredProcedure">
                                                                <SelectParameters>
                                                                    <asp:SessionParameter Name="idSetup" SessionField="idSetup" Type="Int32" />
                                                                    <asp:SessionParameter Name="idCadastroEmpresa" SessionField="idCadastroEmpresa" 
                                                                        Type="Int32" />
                                                                    <asp:ControlParameter ControlID="idCurriculoLabel" Name="idcurriculo" 
                                                                        PropertyName="Text" Type="Int32" />
                                                                    <asp:Parameter DefaultValue="1" Name="titulo" Type="Int32" />
                                                                </SelectParameters>
                                                            </asp:SqlDataSource>
                                                            <asp:SqlDataSource ID="SqlFORMENTREVISTA_PERGUNTA_STEP" runat="server" 
                                                                ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                                                                SelectCommand="_USP_ENTREVISTA_PRESENCIAL_PERGUNTA" 
                                                                SelectCommandType="StoredProcedure">
                                                                <SelectParameters>
                                                                    <asp:SessionParameter Name="idSetup" SessionField="idSetup" Type="Int32" />
                                                                    <asp:SessionParameter Name="idCadastroEmpresa" SessionField="idCadastroEmpresa" 
                                                                        Type="Int32" />
                                                                    <asp:ControlParameter ControlID="idCurriculoLabel" Name="idcurriculo" 
                                                                        PropertyName="Text" Type="Int32" />
                                                                    <asp:ControlParameter ControlID="idProcessoSeletivoLabel" 
                                                                        Name="idProcessoSeletivo" PropertyName="Text" Type="Int32" />
                                                                    <asp:ControlParameter ControlID="idFaseProcessoSeletivoLabel" 
                                                                        Name="idFaseProcessoSeletivo" PropertyName="Text" Type="Int32" />
                                                                </SelectParameters>
                                                            </asp:SqlDataSource>
                                                            <asp:SqlDataSource ID="SqlFORMENTREVISTA_MONTA_PERGUNTA_STEP" runat="server" 
                                                                ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                                                                SelectCommand="_USP_ENTREVISTA_PRESENCIAL_MONTA_BOTAO" 
                                                                SelectCommandType="StoredProcedure">
                                                                <SelectParameters>
                                                                    <asp:SessionParameter Name="idSetup" SessionField="idSetup" Type="Int32" />
                                                                    <asp:SessionParameter Name="idCadastroEmpresa" SessionField="idCadastroEmpresa" 
                                                                        Type="Int32" />
                                                                    <asp:ControlParameter ControlID="idCurriculoLabel" Name="idcurriculo" 
                                                                        PropertyName="Text" Type="Int32" />
                                                                    <asp:ControlParameter ControlID="idPerguntaQuizAVALIACAOLabel" 
                                                                        Name="idPerguntaQuiz" PropertyName="Text" Type="Int32" />
                                                                </SelectParameters>
                                                            </asp:SqlDataSource>
                                                            <br />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:Panel>
                                            <br />
                                            <asp:Label ID="HistoricoDBLabel" runat="server" 
                                                CssClass="textoProcessoSeletivo"></asp:Label>
                                            <br />
                                            <asp:Label ID="ParecerLabel" runat="server" CssClass="textoProcessoSeletivo" 
                                                Text="Avaliação sobre a entrevista com o profissional: (Não será apresentada as suas considerações sobre o(a) candidato(a))"></asp:Label>
                                            <br />
                                            <asp:Label ID="obs" runat="server" Font-Size="Smaller" 
                                                Text="Obs.: Não é obrigatório informar este campo."></asp:Label>
                                            <br />
                                            <asp:TextBox ID="ParecerDoProfissionalTextBox" runat="server" 
                                                CssClass="InputCadFormCandidatoCV" Height="80px" TextMode="MultiLine" 
                                                ValidationGroup="FORM" Width="700px"></asp:TextBox>
                                            <br />
                                            <br />
                                            <asp:Label ID="CabecFormLabel" runat="server" CssClass="textoProcessoSeletivo" 
                                                Text="Mensagem para o candidato:"></asp:Label>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                                ControlToValidate="MensagemTextBox" Display="Dynamic" 
                                                ErrorMessage="Informe o que você quer falar com o candidato" 
                                                ValidationGroup="FORM">•</asp:RequiredFieldValidator>
                                            <br />
                                            <asp:TextBox ID="MensagemTextBox" runat="server" 
                                                CssClass="InputCadFormCandidatoCV" Height="80px" TextMode="MultiLine" 
                                                ValidationGroup="FORM" Width="700px"></asp:TextBox>
                                            <br />
                                            <br />
                                            <asp:RadioButtonList ID="RadioButtonListstatusEntrevista" runat="server" 
                                                CssClass="InputCadFormCandidatoCV" RepeatDirection="Horizontal" Width="100%">
                                                <asp:ListItem Selected="True">Apenas envio e-mail</asp:ListItem>
                                                <asp:ListItem Value="Não compareceu reprovado">Não compareceu</asp:ListItem>
                                                <asp:ListItem Value="Aprovado na fase">Aprovado</asp:ListItem>
                                                <asp:ListItem Value="Reprovado na fase">Reprovado</asp:ListItem>
                                            </asp:RadioButtonList>
                                            <br />
                                            <asp:CheckBox ID="CheckBoxPRESENCIAL" runat="server" 
                                                CssClass="InputCadFormCandidatoCV" Text="Cancelar esta entrevista presencial" 
                                                Width="100%" />
                                            <br />
                                            <br />
                                            <asp:LinkButton ID="LinkButtonENVIAR" runat="server" CssClass="button" 
                                                ToolTip="Clique aqui para salvar e/ou enviar a mensagem para o candidato" 
                                                ValidationGroup="FORM">Salvar</asp:LinkButton>
                                            <asp:LinkButton ID="LinkButtonFECHAR" runat="server" CausesValidation="False" 
                                                CssClass="button" ToolTip="Clique aqui para cancelar o envio">Cancelar</asp:LinkButton>
                                            <asp:LinkButton ID="OpenFormAvaliacao" runat="server" CssClass="button">Formulário de avaliação</asp:LinkButton>
                                            <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                                                ShowMessageBox="True" ShowSummary="False" ValidationGroup="FORM" />
                                            <br />
                                        </asp:Panel>
                                    </td>
                                    <td valign="top" width="50px">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td align="right" valign="top" width="50px">
                                        &nbsp;</td>
                                    <td align="right" width="700px">
                                        &nbsp;</td>
                                    <td valign="top" width="50px">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td align="right" valign="top" width="50px">
                                        <asp:ImageButton ID="ImageButtonVOLTA" runat="server" 
                                            ImageUrl="~/_corporativo/images/holomatica/btCalendarioESQUERDO.png" 
                                            ToolTip="Volta 1 (um) dia" />
                                    </td>
                                    <td width="700px">
                                        <DayPilot:DayPilotCalendar ID="DayPilotCalendarAGENDA" runat="server" 
                                            BackColor="#FFFFD5" BorderColor="#CCCCCC" BusinessBeginsHour="8" 
                                            ClientIDMode="AutoID" ColumnMarginRight="0" DataEndField="DataEndField" 
                                            DataSourceID="SqlCOMPROMISSO" DataStartField="DataStartField" 
                                            DataTextField="TEXTOAPRESENTA" DataValueField="idEntrevistaPresencial" 
                                            DayFontFamily="Tahoma" DayFontSize="10pt" DurationBarColor="#0058B0" 
                                            EventBackColor="#FFFFFF" EventBorderColor="#000000" 
                                            EventClickHandling="PostBack" EventFontFamily="Tahoma" EventFontSize="7pt" 
                                            EventHoverColor="#DCDCDC" FreetimeClickHandling="PostBack" HeaderHeight="20" 
                                            HourBorderColor="#EAD098" HourFontFamily="Tahoma" HourFontSize="16pt" 
                                            HourHalfBorderColor="#F3E4B1" HourHeight="30" HourNameBackColor="#ECE9D8" 
                                            HourNameBorderColor="#ACA899" HourWidth="80" HoverColor="#FFED95" 
                                            NonBusinessBackColor="#FFF4BC" StartDate="" TimeFormat="Clock24Hours" 
                                            Width="100%" />
                                    </td>
                                    <td valign="top" width="50px">
                                        <asp:ImageButton ID="ImageButtonAVANCAR" runat="server" 
                                            ImageUrl="~/_corporativo/images/holomatica/btCalendarioDIREITO.png" 
                                            ToolTip="Avança 1 (um) dia" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" valign="top" width="50px">
                                        &nbsp;</td>
                                    <td align="center" width="700px">
                                        <asp:Calendar ID="CalendarAgenda" runat="server" BackColor="White" 
                                            BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" 
                                            ForeColor="Black" Height="150px" NextPrevFormat="FullMonth" Width="300px">
                                            <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                                            <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" 
                                                VerticalAlign="Bottom" />
                                            <OtherMonthDayStyle ForeColor="#999999" />
                                            <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                                            <TitleStyle BackColor="White" BorderColor="#F4F4F4" BorderStyle="Dotted" 
                                                BorderWidth="1px" Font-Bold="True" Font-Size="10pt" ForeColor="#333399" />
                                            <TodayDayStyle BackColor="#CCCCCC" />
                                        </asp:Calendar>
                                    </td>
                                    <td valign="top" width="50px">
                                        &nbsp;</td>
                                </tr>
                            </table>
                            <br />
                            <br />
                            <br />
                        </td>
                    </tr>
                </table>
                <table runat="server" visible="false" cellpadding="0" cellspacing="0" id="BodyInternoVIRTUAL" width="930px" align="center">
                    <tr>
                        <td align="left">
                            <br />
                                <asp:Image ID="ImageLinha2" runat="server" 
                                    ImageUrl="~/_corporativo/images/holomatica/linha.png" />
                                <asp:Label ID="CabecLabelVirtual" runat="server" CssClass="h1" 
                                    Text="Entrevistas Virtuais "></asp:Label>

                                <asp:Label ID="naDataLabelVIRTUAL" runat="server" CssClass="h1"></asp:Label>
                            <asp:Label ID="idEntrevistaVirtualLabel" runat="server" Visible="False"></asp:Label>

                            <table id="Table1" align="center" cellpadding="2" cellspacing="2" width="800px">
                                <tr>
                                    <td align="right" valign="top" width="50px">&nbsp;</td>
                                    <td width="700px">
                                        <asp:Panel ID="PanelFORMVIRTUAL" runat="server" Visible="False">
                                            <asp:Label ID="HistoricoDBLabel0" runat="server" 
                                                CssClass="textoProcessoSeletivo"></asp:Label>
                                            <br />
                                            <asp:Label ID="ParecerLabel0" runat="server" CssClass="textoProcessoSeletivo" 
                                                
                                                Text="Avaliação sobre a entrevista com o profissional: (Não será apresentada as suas considerações sobre o(a) candidato(a))"></asp:Label>
                                            <br />
                                            <asp:Label ID="obs0" runat="server" Font-Size="Smaller" 
                                                Text="Obs.: Não é obrigatório informar este campo."></asp:Label>
                                            <br />
                                            <asp:TextBox ID="ParecerDoProfissionalTextBox0" runat="server" 
                                                CssClass="InputCadFormCandidatoCV" Height="80px" TextMode="MultiLine" 
                                                ValidationGroup="FORM" Width="700px"></asp:TextBox>
                                            <br />
                                            <br />
                                            <asp:Label ID="CabecFormLabel0" runat="server" CssClass="textoProcessoSeletivo" 
                                                Text="Fale com o candidato:"></asp:Label>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                                ControlToValidate="MensagemTextBox0" Display="Dynamic" 
                                                ErrorMessage="Informe o que você quer falar com o candidato" 
                                                ValidationGroup="FORMVIRTUAL">•</asp:RequiredFieldValidator>
                                            <br />
                                            <asp:TextBox ID="MensagemTextBox0" runat="server" 
                                                CssClass="InputCadFormCandidatoCV" Height="80px" TextMode="MultiLine" 
                                                ValidationGroup="FORMVIRTUAL" Width="700px"></asp:TextBox>
                                            <br />
                                            <br />
                                            <asp:LinkButton ID="LinkButtonHITORICO" runat="server">[+] Ver o histórico da entrevista virtual</asp:LinkButton>
                                            <br />
                                            <br />
                                            <asp:RadioButtonList ID="RadioButtonListstatusEntrevista0" runat="server" 
                                                CssClass="InputCadFormCandidatoCV" RepeatDirection="Horizontal" 
                                                Width="100%">
                                                <asp:ListItem>Apenas envio e-mail</asp:ListItem>
                                                <asp:ListItem Value="Não compareceu reprovado">Não compareceu</asp:ListItem>
                                                <asp:ListItem Value="Aprovado na fase">Aprovado</asp:ListItem>
                                                <asp:ListItem Value="Reprovado na fase">Reprovado</asp:ListItem>
                                            </asp:RadioButtonList>
                                            <br />
                                            <asp:RadioButtonList ID="RadioButtonListVIRTUAL" runat="server" 
                                                CssClass="InputCadFormCandidatoCV" RepeatDirection="Horizontal" Width="100%">
                                                <asp:ListItem Value="2">Cancelar esta entrevista virtual</asp:ListItem>
                                                <asp:ListItem Value="1">Confirmar entrevista virtual pelo candidato</asp:ListItem>
                                            </asp:RadioButtonList>
                                            <br />
                                            <br />
                                            <asp:LinkButton ID="LinkButtonENVIAR0" runat="server" CssClass="button" 
                                                ToolTip="Clique aqui para salvar e/ou enviar a mensagem para o candidato" 
                                                ValidationGroup="FORMVIRTUAL">Salvar</asp:LinkButton>
                                            <asp:LinkButton ID="LinkButtonFECHAR0" runat="server" CausesValidation="False" 
                                                CssClass="button" ToolTip="Clique aqui para cancelar o envio">Cancelar</asp:LinkButton>
                                            <asp:ValidationSummary ID="ValidationSummary2" runat="server" 
                                                ShowMessageBox="True" ShowSummary="False" ValidationGroup="FORMVIRTUAL" />
                                            <br />
                                        </asp:Panel>
                                    </td>
                                    <td valign="top" width="50px">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td align="right" valign="top" width="50px">&nbsp;</td>
                                    <td width="700px">&nbsp;</td>
                                    <td valign="top" width="50px">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td align="right" valign="top" width="50px">
                                        <asp:ImageButton ID="ImageButtonVOLTAVIRTUAL" runat="server" 
                                            ImageUrl="~/_corporativo/images/holomatica/btCalendarioESQUERDO.png" 
                                            ToolTip="Volta 1 (um) dia" />
                                    </td>
                                    <td width="700px" align="center" valign="top">
                                        <DayPilot:DayPilotCalendar ID="DayPilotCalendarAGENDAVIRTUAL" runat="server" 
                                            BackColor="#FFFFD5" BorderColor="#CCCCCC" BusinessBeginsHour="8" 
                                            ClientIDMode="AutoID" ColumnMarginRight="0" DataEndField="DataEndField" 
                                            DataSourceID="SqlCOMPROMISSOVIRTUAL" DataStartField="DataStartField" 
                                            DataTextField="TEXTOAPRESENTA" DataValueField="idEntrevistaVirtual" 
                                            DayFontFamily="Tahoma" DayFontSize="10pt" DurationBarColor="#0058B0" 
                                            EventBackColor="White" EventBorderColor="Black" 
                                            EventClickHandling="PostBack" EventFontFamily="Tahoma" EventFontSize="7pt" 
                                            EventHoverColor="Gainsboro" FreetimeClickHandling="PostBack" HeaderHeight="20" 
                                            HourBorderColor="#EAD098" HourFontFamily="Tahoma" HourFontSize="16pt" 
                                            HourHalfBorderColor="#F3E4B1" HourHeight="30" HourNameBackColor="#ECE9D8" 
                                            HourNameBorderColor="#ACA899" HourWidth="80" HoverColor="#FFED95" 
                                            NonBusinessBackColor="#FFF4BC" StartDate="" TimeFormat="Clock24Hours" 
                                            Width="100%" />
                                    </td>
                                    <td valign="top" width="50px">
                                        <asp:ImageButton ID="ImageButtonAVANCARVIRTUAL" runat="server" 
                                            ImageUrl="~/_corporativo/images/holomatica/btCalendarioDIREITO.png" 
                                            ToolTip="Avança 1 (um) dia" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" valign="top" width="50px">&nbsp;</td>
                                    <td width="700px" align="center">
                                        <asp:Calendar ID="CalendarAgendaVirtual" runat="server" BackColor="White" 
                                            BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" 
                                            ForeColor="Black" Height="150px" NextPrevFormat="FullMonth" Width="300px">
                                            <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                                            <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" 
                                                VerticalAlign="Bottom" />
                                            <OtherMonthDayStyle ForeColor="#999999" />
                                            <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                                            <TitleStyle BackColor="White" BorderColor="#F4F4F4" BorderStyle="Dotted" 
                                                BorderWidth="1px" Font-Bold="True" Font-Size="10pt" ForeColor="#333399" />
                                            <TodayDayStyle BackColor="#CCCCCC" />
                                        </asp:Calendar>
                                    </td>
                                    <td valign="top" width="50px">&nbsp;</td>
                                </tr>
                            </table>
                            <br />
                            <asp:Panel ID="PanelHISTORICO" runat="server" Visible="False">
                                <table cellpadding="5" cellspacing="5" ID="HISTORICO" align="center" 
                                    width="800px">
                                    <tr>
                                        <td align="left">
                                            <asp:Label ID="DataLabel" runat="server" CssClass="textoNone"></asp:Label>
                                            <br />
                                            <asp:Image ID="ImageLinha3" runat="server" 
                                                ImageUrl="~/_corporativo/images/holomatica/linha800.png" />
                                            <br />
                                            <asp:Label ID="HistoricoLabel" runat="server" CssClass="textoNone"></asp:Label>
                                            <br />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left" bgcolor="#FDFFDD">
                                            <asp:Image ID="ImageLinha4" runat="server" 
                                                ImageUrl="~/_corporativo/images/holomatica/linha800.png" />
                                            <br />
                                            <asp:Label ID="LaudoLabel" runat="server" CssClass="textoNone" 
                                                Font-Italic="True"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                            <br />
                        </td>
                    </tr> 
                </table>
                <table runat="server" visible="false" cellpadding="0" cellspacing="0" id="BodyInternoAVALIACAO" width="930px" align="center">
                    <tr>
                        <td align="left">
                        <br />
                        <asp:Image ID="Image2" runat="server" 
                                    ImageUrl="~/_corporativo/images/holomatica/linha.png" />
                                <asp:Label ID="CabecLabelAVALIACAO" runat="server" CssClass="h1" 
                                    Text="Avaliações solicitadas"></asp:Label>
                                <asp:Panel ID="PanelEMAIL" runat="server">
                                    <table id="EMAIL" cellpadding="5" cellspacing="5" width="900px" align="center">
                                        <tr>
                                            <td>
                                                <table ID="CONTATO" cellpadding="5" cellspacing="5" width="100%">
                                                    <tr>
                                                        <td>
                                                            <table cellpadding="0" cellspacing="0">
                                                                <tr>
                                                                    <td>
                                                                        <asp:Image ID="ImageAVISOREPROVACAO1" runat="server" 
                                                                            ImageUrl="~/_corporativo/images/_bottonAvisoSISTEMA.png" />
                                                                    </td>
                                                                    <td>
                                                                        <asp:Label ID="LabelEMAILCANDIDATO" runat="server" CssClass="textoGeral"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:DataList ID="DataListTeste" runat="server" DataSourceID="QuizFormulario" 
                                                                Width="100%" BorderColor="#999999" BorderStyle="Dotted" BorderWidth="1px">
                                                                <AlternatingItemStyle BackColor="#F7F7F7" />
                                                                <ItemTemplate>
                                                                    <table cellpadding="2" cellspacing="2" width="100%">
                                                                        <tr>
                                                                            <td width="500">
                                                                                <asp:Label ID="Label13" runat="server" CssClass="cur01st" Text="Pergunta:"></asp:Label>
                                                                                <br />
                                                                                <asp:Label ID="perguntaQuizLabel" runat="server" 
                                                                                    Text='<%# Eval("perguntaQuiz") %>' />
                                                                            </td>
                                                                            <td valign="bottom">
                                                                                <asp:Label ID="Label14" runat="server" CssClass="cur01st" 
                                                                                    Text="Resposta correta:"></asp:Label>
                                                                                <br />
                                                                                <asp:Label ID="RespostaCertaLabel" runat="server" 
                                                                                    Text='<%# Eval("RespostaCerta") %>' />
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td width="500">
                                                                                &nbsp;</td>
                                                                            <td align="left" valign="top">
                                                                                <asp:Label ID="Label15" runat="server" CssClass="cur01st" 
                                                                                    Text="Resposta do candidato:"></asp:Label>
                                                                                <table cellpadding="0" cellspacing="0">
                                                                                    <tr>
                                                                                        <td>
                                                                                            <asp:Image ID="ImageTeste" runat="server" ImageUrl='<%# Eval("imagem") %>' />
                                                                                        </td>
                                                                                        <td>
                                                                                            <asp:Label ID="RespostaCandidatoLabel" runat="server" 
                                                                                                Text='<%# Eval("RespostaCandidato") %>' />
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td width="500">
                                                                                &nbsp;</td>
                                                                            <td>
                                                                                &nbsp;</td>
                                                                        </tr>
                                                                    </table>
                                                                    &nbsp;<asp:Label ID="idPerguntaQuizLabel" runat="server" 
                                                                        Text='<%# Eval("idPerguntaQuiz") %>' Visible="False" />
                                                                    <asp:Label ID="idRespostaQuizCandidatoLabel" runat="server" 
                                                                        Text='<%# Eval("idRespostaQuizCandidato") %>' Visible="False" />
                                                                    <asp:Label ID="idRespostaQuizCertaLabel" runat="server" 
                                                                        Text='<%# Eval("idRespostaQuizCerta") %>' Visible="False" />
                                                                    <asp:Label ID="PontoCertaLabel" runat="server" Text='<%# Eval("PontoCerta") %>' 
                                                                        Visible="False" />
                                                                    <asp:Label ID="PontoCandidatoLabel" runat="server" 
                                                                        Text='<%# Eval("PontoCandidato") %>' Visible="False" />
                                                                    <br />
                                                                </ItemTemplate>
                                                            </asp:DataList>
                                                            <br />
                                                            <asp:SqlDataSource ID="QuizFormulario" runat="server" 
                                                                ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                                                                SelectCommand="_USP_QUIZ_CANDIDATO_APRESENTA_PERGUNTA_CORRETA" 
                                                                SelectCommandType="StoredProcedure">
                                                                <SelectParameters>
                                                                    <asp:ControlParameter ControlID="idUserLabel" Name="idUser" PropertyName="Text" 
                                                                        Type="Int32" />
                                                                    <asp:ControlParameter ControlID="idQuizLabel" Name="idQuiz" PropertyName="Text" 
                                                                        Type="Int32" />
                                                                </SelectParameters>
                                                            </asp:SqlDataSource>
                                                            <br />
                                                            <asp:Label ID="Label8" runat="server" 
                                                                Text="Mensagem padrão que será enviada ao candidato:" 
                                                                CssClass="tituloEmpresa"></asp:Label>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                                                ControlToValidate="RadioButtonListCandidato" 
                                                                ErrorMessage="Informe uma ação a ser tomada quanto ao candidato" 
                                                                ValidationGroup="MENSAGEMCANDIDATO">*</asp:RequiredFieldValidator>
                                                            <br />
                                                            <asp:RadioButtonList ID="RadioButtonListCandidato" runat="server">
                                                                <asp:ListItem></asp:ListItem>
                                                                <asp:ListItem></asp:ListItem>
                                                            </asp:RadioButtonList>
                                                            <br />
                                                            <asp:ValidationSummary ID="ValidationSummary3" runat="server" 
                                                                ShowMessageBox="True" ValidationGroup="MENSAGEMCANDIDATO" />
                                                            <br />
                                                            <asp:Label ID="textoMensagemLabel" runat="server" 
                                                                
                                                                Text="Se desejar escreva abaixo informações sobre o candidato para futuras avaliações ou contratações:&lt;br&gt;Obs.: Estas anotações serão gravadas no histórico deste candidato."></asp:Label>
                                                            <br />
                                                            <asp:TextBox ID="mensagemTextBoxCANDIDATO" runat="server" 
                                                                CssClass="InputCadFormCandidatoCV" Height="80px" TextMode="MultiLine" 
                                                                ValidationGroup="MENSAGEMCANDIDATO" Width="100%"></asp:TextBox>
                                                            <br />
                                                            <br />
                                                            <asp:LinkButton ID="LinkButtonENVIAR1" runat="server" CssClass="button" 
                                                                ValidationGroup="MENSAGEMCANDIDATO" onclientclick="GetMensagem();">Enviar</asp:LinkButton>
                                                            <asp:LinkButton ID="LinkButtonCANCELAR1" runat="server" CssClass="button" 
                                                                CausesValidation="False">Fechar</asp:LinkButton>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                                </td>
                    </tr>
                    <tr>
                        <td align="left">
                           <table id="Table2" align="center" cellpadding="2" cellspacing="2" width="900px">
                                <tr>
                                    <td width="700px">
                                        <asp:GridView ID="GridViewAVALIACAO" runat="server" AutoGenerateColumns="False" 
                                            BorderStyle="None" 
                                            DataKeyNames="idCurriculo,idRH_GESTOR,idQuizCandidato,dsProcesso,nomeQuiz,idQuiz,idUser,idProcessoSeletivo,idFaseProcessoSeletivo,nomeCandidato,nome,dsFase" 
                                            DataSourceID="SqlAVALIACAO" GridLines="None" ShowHeader="False" 
                                            Width="100%">
                                            <Columns>
                                                <asp:TemplateField HeaderText="ID" InsertVisible="False" SortExpression="ID">
                                                    <EditItemTemplate>
                                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("ID") %>'></asp:Label>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <table ID="RES0" runat="server" cellpadding="2" cellspacing="2" width="890">
                                                            <tr>
                                                                <td align="right" bgcolor="#FFFFEC" width="300px">
                                                                    <asp:Label ID="Label12" runat="server" Text="Protocolo:"></asp:Label>
                                                                </td>
                                                                <td bgcolor="#FFFFEC">
                                                                    <asp:Label ID="ProtocoloLabel" runat="server" Font-Bold="True" 
                                                                        Text='<%# Eval("protocolo") %>'></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="right" bgcolor="#FFFFEC" width="300px">
                                                                    <asp:Label ID="Label9" runat="server" Text="Processo/Fase:"></asp:Label>
                                                                </td>
                                                                <td bgcolor="#FFFFEC">
                                                                    <asp:Label ID="processoLabel" runat="server" Text='<%# Eval("dsProcesso") %>'></asp:Label>
                                                                    <asp:Label ID="Label11" runat="server" Text="/"></asp:Label>
                                                                    <asp:Label ID="faseLabel" runat="server" Text='<%# Eval("dsFase") %>'></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="right" bgcolor="#FFFFEC" width="300px">
                                                                    <asp:Label ID="Label1" runat="server" Text="Analista/Consultor:"></asp:Label>
                                                                </td>
                                                                <td bgcolor="#FFFFEC">
                                                                    <asp:Label ID="nomeLabel" runat="server" CssClass="textoResumoCV" 
                                                                        Text='<%# Eval("nome") %>' />
                                                                    &nbsp;<asp:Label ID="emailLabel" runat="server" CssClass="textoResumoCV" 
                                                                        Text='<%# Eval("email") %>' />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="right" bgcolor="#FFFFEC" width="300px">
                                                                    <asp:Label ID="Label2" runat="server" Text="Avaliação:"></asp:Label>
                                                                </td>
                                                                <td bgcolor="#FFFFEC">
                                                                    <asp:Label ID="nomeQuizLabel" runat="server" Text='<%# Eval("nomeQuiz") %>' />
                                                                    <asp:Label ID="nivelLabel" runat="server" Text='<%# Eval("nivel") %>' />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="right" bgcolor="#FFFFEC" width="300px">
                                                                    <asp:Label ID="Label3" runat="server" Text="Candidato:"></asp:Label>
                                                                </td>
                                                                <td bgcolor="#FFFFEC">
                                                                    <asp:Label ID="nomeCandidatoLabel" runat="server" 
                                                                        Text='<%# Eval("nomeCandidato") %>' />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="right" bgcolor="#FFFFEC" width="300px">
                                                                    <asp:Label ID="Label4" runat="server" Text="Resposta(s) correta(s):"></asp:Label>
                                                                </td>
                                                                <td bgcolor="#FFFFEC">
                                                                    <asp:Label ID="TOTALPONTOSLabel" runat="server" 
                                                                        Text='<%# Eval("TOTALPONTOS") %>' />
                                                                    &nbsp;|
                                                                    <asp:Label ID="Label7" runat="server" Text="   Nota de corte: "></asp:Label>
                                                                    <asp:Label ID="corteLabel" runat="server" Text='<%# Eval("corte") %>' />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="right" bgcolor="#FFFFEC" width="300px">
                                                                    <asp:Label ID="Label5" runat="server" Text="Total de perguntas aplicadas:"></asp:Label>
                                                                </td>
                                                                <td bgcolor="#FFFFEC">
                                                                    <asp:Label ID="TOTALDEPERGUNTASLabel" runat="server" 
                                                                        Text='<%# Eval("TOTALDEPERGUNTAS") %>' />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="right" bgcolor="#F2F2F2" width="300px">
                                                                    <asp:Label ID="Label6" runat="server" Text="Resultado:"></asp:Label>
                                                                </td>
                                                                <td bgcolor="#F2F2F2">
                                                                    <asp:Label ID="MENSAGEMLabel" runat="server" CssClass='<%# Eval("COLOR") %>' 
                                                                        Text='<%# Eval("MENSAGEM") %>' />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="right" width="300px">
                                                                    &nbsp;</td>
                                                                <td>
                                                                    <br />
                                                                    <asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" 
                                                                        CommandName="Select" CssClass="button" 
                                                                        
                                                                        
                                                                        ToolTip="Clique aqui para analisar a avaliação, reprovar ou aprovar o candidato." 
                                                                        Visible='<%# Eval("finalizado") %>'>Analisar Avaliação</asp:LinkButton>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="idQuizCandidato" HeaderText="idQuizCandidato" 
                                                    SortExpression="idQuizCandidato" Visible="False" />
                                                <asp:BoundField DataField="finalizado" HeaderText="finalizado" 
                                                    SortExpression="finalizado" Visible="False" />
                                                <asp:BoundField DataField="idSetup" HeaderText="idSetup" 
                                                    SortExpression="idSetup" Visible="False" />
                                                <asp:BoundField DataField="idCurriculo" HeaderText="idCurriculo" 
                                                    SortExpression="idCurriculo" Visible="False" />
                                                <asp:BoundField DataField="idRH_GESTOR" HeaderText="idRH_GESTOR" 
                                                    SortExpression="idRH_GESTOR" Visible="False" />
                                                <asp:BoundField DataField="avaliadoAnalista" HeaderText="avaliadoAnalista" 
                                                    SortExpression="avaliadoAnalista" Visible="False" />
                                                <asp:BoundField DataField="nome" HeaderText="nome" SortExpression="nome" 
                                                    Visible="False" />
                                                <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" 
                                                    Visible="False" />
                                                <asp:BoundField DataField="nomeQuiz" HeaderText="nomeQuiz" 
                                                    SortExpression="nomeQuiz" Visible="False" />
                                                <asp:BoundField DataField="nivel" HeaderText="nivel" SortExpression="nivel" 
                                                    Visible="False" />
                                                <asp:BoundField DataField="nomeCandidato" HeaderText="nomeCandidato" 
                                                    SortExpression="nomeCandidato" Visible="False" />
                                                <asp:BoundField DataField="TOTALPONTOS" HeaderText="TOTALPONTOS" 
                                                    SortExpression="TOTALPONTOS" Visible="False" />
                                                <asp:BoundField DataField="corte" HeaderText="corte" SortExpression="corte" 
                                                    Visible="False" />
                                                <asp:BoundField DataField="TOTALDEPERGUNTAS" HeaderText="TOTALDEPERGUNTAS" 
                                                    SortExpression="TOTALDEPERGUNTAS" Visible="False" />
                                                <asp:BoundField DataField="MENSAGEM" HeaderText="MENSAGEM" 
                                                    SortExpression="MENSAGEM" Visible="False" />
                                                <asp:BoundField DataField="COLOR" HeaderText="COLOR" SortExpression="COLOR" 
                                                    Visible="False" />
                                                <asp:BoundField DataField="dsProcesso" HeaderText="dsProcesso" 
                                                    SortExpression="dsProcesso" Visible="False" />
                                                <asp:BoundField DataField="dsFase" HeaderText="dsFase" SortExpression="dsFase" 
                                                    Visible="False" />
                                                <asp:BoundField DataField="protocolo" HeaderText="protocolo" 
                                                    SortExpression="protocolo" Visible="False" />
                                            </Columns>
                                            <EmptyDataTemplate>
                                                <table ID="COMUNICADORNULL" align="center" cellpadding="2" cellspacing="2" 
                                                    width="800">
                                                    <tr>
                                                        <td align="right" valign="top" width="300">
                                                            <asp:Image ID="ImageAviso" runat="server" 
                                                                ImageUrl="~/_corporativo/images/_bottonAvisoSISTEMA.png" />
                                                        </td>
                                                        <td width="500">
                                                            <asp:Label ID="LabelOUTLOOKAVISO" runat="server" CssClass="textoGeral" 
                                                                Text="Não existem avaliações agendadas.&lt;br&gt;Utilize o link &quot;&lt;b&gt;Pesquisa Processo Seletivo&lt;/b&gt;&quot; para agendar uma avaliações com os candidatos."></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </EmptyDataTemplate>
                                        </asp:GridView>
                                    </td>
                                </tr>
                           </table>                                  
                        </td>
                    </tr>
                </table> 
                    <br />
                    <br />
                    <br />
                    <br />

                            <asp:SqlDataSource ID="SqlCOMPROMISSOVIRTUAL" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                                SelectCommand="_USP_PROCESSOSELETIVO_CANDIDATURA_ENTREVISTA_VIRTUAL_COMPROMISSO" 
                                SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:SessionParameter Name="idRH_Gestor" SessionField="idRH_Gestor" 
                                        Type="Int32" />
                                    <asp:Parameter DefaultValue="0" Name="idEntrevistaVirtual" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>

                    <asp:SqlDataSource ID="SqlCOMPROMISSO" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                        SelectCommand="_USP_PROCESSOSELETIVO_CANDIDATURA_ENTREVISTA_COMPROMISSO" 
                        SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="idRH_Gestor" SessionField="idRH_Gestor" 
                                Type="Int32" />
                            <asp:Parameter DefaultValue="0" Name="idEntrevistaPresencial" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>


                    <asp:SqlDataSource ID="SqlAVALIACAO" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                        SelectCommand="_USP_QUIZ_CANDIDATO_RESULTADO_AVALIACAO" 
                        SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="idSetup" SessionField="idSetup" Type="Int32" />
                            <asp:SessionParameter Name="idCadastroEmpresa" SessionField="idCadastroEmpresa" 
                                Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>



                

                



</asp:Content>

