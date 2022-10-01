<%@ Page Title="" Language="VB" MaintainScrollPositionOnPostback="false" MasterPageFile="~/_consultor/ConsultorMasterPage.master" AutoEventWireup="false" CodeFile="_runProcessoSeletivo.aspx.vb" Inherits="_empresa_runProcessoSeletivo" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
<%@ Register assembly="DayPilot" namespace="DayPilot.Web.Ui" tagprefix="DayPilot" %>
<%@ Register assembly="am.Charts" namespace="am.Charts" tagprefix="cc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <table width="640" cellpadding="0" cellspacing="0">
            <tr>
                <td width="26">&nbsp;</td>
                <td width="614">
                    <asp:ImageButton ID="ImageButtonDica" runat="server" CausesValidation="False" 
                        ImageUrl="~/images/aviso.png" />
                    <cc1:HoverMenuExtender ID="ImageButtonDica_HoverMenuExtender" runat="server" 
                        DynamicServicePath="" Enabled="True" OffsetX="10" OffsetY="10" PopDelay="5" 
                        PopupControlID="PanelDica" TargetControlID="ImageButtonDica">
                    </cc1:HoverMenuExtender>
                    <asp:Label ID="LabelCabec" runat="server" CssClass="tituloEmpresa"></asp:Label></td>
            </tr>
        </table>
        <table width="640" cellpadding="0" cellspacing="0">
            <tr>
                <td width="26">
                    <asp:Image ID="lateral" runat="server" ImageUrl="~/images/h26.gif" />
                </td>
                <td width="614">
                <table id="DropDownTable" cellpadding="2" cellspacing="0" width="100%">
                    <tr>
                        <td align="left" valign="top" width="50%">
                            <asp:Label ID="Passo1Label" runat="server" CssClass="tituloEmp" 
                                Text="Selecionar uma Empresa:"></asp:Label>
                            <br />
                            <asp:DropDownList ID="DropDownListSelectEmpresa" runat="server" 
                                CssClass="DropCad" DataSourceID="SqlEmpresa" DataTextField="nmempresa" 
                                DataValueField="idCadastroEmpresa" ValidationGroup="SelectEmpresa" 
                                AutoPostBack="True">
                            </asp:DropDownList></td>
                        <td align="center" width="50%">

                        <ContentTemplate>
                            <asp:GridView ID="GridViewVAGA" runat="server" AllowPaging="True" 
                                AutoGenerateColumns="False" BorderStyle="None" 
                                DataKeyNames="idProcessoSeletivo,idVaga,idRH_Gestor,Protocolo,dsCargo" DataSourceID="SqlVaga" 
                                GridLines="None" PageSize="5">
                                <Columns>
                                    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                                        ReadOnly="True" SortExpression="ID" Visible="False" />
                                    <asp:TemplateField HeaderText="Protocolo (Vaga)" ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                                CommandName="Select" Text='<%# Eval("Protocolo") %>' 
                                                ToolTip='<%# Eval("dsCargo") %>'></asp:LinkButton>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left" />
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="Protocolo" HeaderText="Protocolo (Vaga)" 
                                        SortExpression="Protocolo" Visible="False" />
                                    <asp:BoundField DataField="idProcessoSeletivo" HeaderText="idProcessoSeletivo" 
                                        SortExpression="idProcessoSeletivo" Visible="False" />
                                    <asp:BoundField DataField="idVaga" HeaderText="idVaga" SortExpression="idVaga" 
                                        Visible="False" />
                                    <asp:BoundField DataField="idRH_Gestor" HeaderText="idRH_Gestor" 
                                        SortExpression="idRH_Gestor" Visible="False" />
                                </Columns>
                                <EmptyDataTemplate>
                                    <table cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td align="center">
                                                <asp:Image ID="Image19" runat="server" ImageUrl="~/images/aviso.png" />
                                                <br />
                                                <asp:Label ID="Label52" runat="server" 
                                                    Text="Apenas as vagas cadastradas por você serão apresentadas aqui."></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </EmptyDataTemplate>
                            </asp:GridView>
                        </ContentTemplate>

                        </td>
                    </tr>
                </table>
                        <asp:Panel ID="PanelDica" runat="server" BackColor="#FFFFEC" Width="500px">
                            <table cellpadding="10" cellspacing="10" id="Aviso">
                                <tr>
                                    <td>
                                        <table cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td>
                                                    <asp:Image ID="ImageAviso" runat="server" 
                                                                            ImageUrl="~/images/empresa/aviso.png" />
                                                </td>
                                                <td>
                                                    <asp:Label ID="Label51" runat="server" 
                                                                            
                                                                            
                                                        Text="&lt;b&gt;Dica:&lt;/b&gt;&lt;br&gt;Para iniciar uma Pesquisa de Candidatos (Processo Seletivo) é necessário escolher o protocólo da vaga que deseja trabalhar. Após selecionar será apresentado as fases e seus status.&lt;br&gt;Agora é só iniciar a pesquisa na base, o filtro já está configurado. Se desejar alterar os parâmentros vá em &lt;b&gt;[Pesquisa de Candidatos] / [Pesquisa de Candidatos (Filtros)]&lt;/b&gt; na barra de navegação acima."></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                    </asp:Panel>
                    <br />
                        <asp:Label ID="CargoLabel" runat="server" CssClass="tituloEmpresa"></asp:Label>
                    <br />
                    <asp:Label ID="ProtocoloCabecLabel" runat="server"></asp:Label>
                        <asp:Label ID="dsFaseLabel" runat="server" Visible="False"></asp:Label>
                        <br />
                    <asp:GridView ID="GridViewApresentaFaseAtiva" runat="server" ShowHeader="False" 
                        Width="100%" BorderStyle="None" Font-Bold="True">
                    </asp:GridView>
                        <asp:Panel ID="PanelFase" runat="server" Visible="False">
                            <table ID="LG" cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td>
                                        <asp:GridView ID="GridViewListaCandidatos" runat="server" 
                                            AutoGenerateColumns="False" 
                                            DataKeyNames="idcurriculo,idFaseProcessoSeletivo,idTipoFaseProcessoSeletivo,idUser" 
                                            DataSourceID="SqlListaSelecionados" ShowHeader="False" Width="100%">
                                            <Columns>
                                                <asp:TemplateField HeaderText="Candidato" SortExpression="nome">
                                                    <ItemTemplate>
                                                        <asp:Image ID="Image18" runat="server" ImageUrl="~/images/empresa/dica.png" 
                                                            ToolTip='<%# Eval("comentario", "Comentário sobre o CV: {0}") %>' />
                                                        <asp:LinkButton ID="LinkButtonnomeCandidato" runat="server" 
                                                            CommandName="Select" Text='<%# Eval("nome") %>' CausesValidation="False"></asp:LinkButton>
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("nome") %>'></asp:TextBox>
                                                    </EditItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="idcurriculo" HeaderText="idcurriculo" 
                                                    InsertVisible="False" ReadOnly="True" SortExpression="idcurriculo" 
                                                    Visible="False" />
                                                <asp:BoundField DataField="idCadastroUser" HeaderText="idCadastroUser" 
                                                    SortExpression="idCadastroUser" Visible="False" />
                                                <asp:BoundField DataField="dscurriculo" HeaderText="dscurriculo" 
                                                    SortExpression="dscurriculo" Visible="False" />
                                                <asp:BoundField DataField="ididioma" HeaderText="ididioma" 
                                                    SortExpression="ididioma" Visible="False" />
                                                <asp:CheckBoxField DataField="publicar" HeaderText="publicar" 
                                                    SortExpression="publicar" Visible="False" />
                                                <asp:BoundField DataField="dataUltimaAtualizacao" DataFormatString="{0:d}" 
                                                    HeaderText="dataUltimaAtualizacao" SortExpression="dataUltimaAtualizacao" 
                                                    Visible="False" />
                                                <asp:BoundField DataField="contador" HeaderText="Visualizado" 
                                                    SortExpression="contador" Visible="False" />
                                                <asp:BoundField DataField="idProcessoSeletivo" HeaderText="idProcessoSeletivo" 
                                                    SortExpression="idProcessoSeletivo" Visible="False" />
                                                <asp:BoundField DataField="idFaseProcessoSeletivo" 
                                                    HeaderText="idFaseProcessoSeletivo" InsertVisible="False" ReadOnly="True" 
                                                    SortExpression="idFaseProcessoSeletivo" Visible="False" />
                                                <asp:BoundField DataField="idFaseProcessoSeletivoCV" 
                                                    HeaderText="idFaseProcessoSeletivoCV" InsertVisible="False" ReadOnly="True" 
                                                    SortExpression="idFaseProcessoSeletivoCV" Visible="False" />
                                                <asp:BoundField DataField="comentario" HeaderText="Comentário" 
                                                    SortExpression="comentario" Visible="False" />
                                                <asp:TemplateField HeaderText="Pontos" SortExpression="pontuacao">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("pontuacao") %>' 
                                                            ToolTip='<%# Eval("dataUltimaAtualizacao") %>'></asp:Label>
                                                        <asp:Image ID="Image17" runat="server" ImageUrl="~/images/empresa/dica.png" 
                                                            ToolTip='<%# Eval("dataUltimaAtualizacao", "Última atualização: {0}") %>' />
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("pontuacao") %>'></asp:TextBox>
                                                    </EditItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="idTipoFaseProcessoSeletivo" 
                                                    HeaderText="idTipoFaseProcessoSeletivo" 
                                                    SortExpression="idTipoFaseProcessoSeletivo" Visible="False" />
                                                <asp:BoundField DataField="areaAtuacao" HeaderText="areaAtuacao" 
                                                    SortExpression="areaAtuacao" />
                                                <asp:TemplateField HeaderText="flgAprovado" SortExpression="flgAprovado" 
                                                    Visible="False">
                                                    <ItemTemplate>
                                                        <asp:Label ID="AprovadoLabel" runat="server" Text='<%# Bind("flgAprovado") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("flgAprovado") %>'></asp:TextBox>
                                                    </EditItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="idUser" HeaderText="idUser" SortExpression="idUser" 
                                                    Visible="False" />
                                            </Columns>
                                        </asp:GridView>
                                        <asp:ImageButton ID="ImageButtonFinalizaPS" runat="server" 
                                            ImageUrl="~/images/empresa/btFinalizaProcessoSeletivo.png" 
                                            onclientclick="return confirm(&quot;Você está para finalizar este Processo Seletivo,\nse você estiver certo disso clique em [OK].&quot;)" />
                                        <br />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:GridView ID="GridViewFase" runat="server" AutoGenerateColumns="False" 
                                            BorderColor="#CCCCCC" BorderStyle="Dotted" BorderWidth="1px" 
                                            DataKeyNames="idFaseProcessoSeletivo,idTipoFaseProcessoSeletivo,Protocolo,dsFase" 
                                            DataSourceID="SqlFaseExe" GridLines="Horizontal" Width="100%">
                                            <Columns>
                                                <asp:TemplateField SortExpression="ColorAviso">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ColorAviso") %>'></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Image ID="Image2" runat="server" ImageUrl='<%# Eval("ColorAviso") %>' 
                                                            ToolTip='<%# Eval("TextButtonFase") %>' />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                                                    ReadOnly="True" SortExpression="ID" Visible="False" />
                                                <asp:BoundField DataField="Protocolo" HeaderText="Protocolo" 
                                                    SortExpression="Protocolo" />
                                                <asp:BoundField DataField="dataIni" DataFormatString="{0:d}" 
                                                    HeaderText="Início" SortExpression="dataIni" />
                                                <asp:BoundField DataField="dataFim" DataFormatString="{0:d}" HeaderText="Final" 
                                                    SortExpression="dataFim" />
                                                <asp:BoundField DataField="dsFase" HeaderText="Fase" SortExpression="dsFase" />
                                                <asp:BoundField DataField="idFaseProcessoSeletivo" 
                                                    HeaderText="idFaseProcessoSeletivo" SortExpression="idFaseProcessoSeletivo" 
                                                    Visible="False" />
                                                <asp:BoundField DataField="idTipoFaseProcessoSeletivo" 
                                                    HeaderText="idTipoFaseProcessoSeletivo" 
                                                    SortExpression="idTipoFaseProcessoSeletivo" Visible="False" />
                                                <asp:BoundField DataField="idSetup" HeaderText="idSetup" 
                                                    SortExpression="idSetup" Visible="False" />
                                                <asp:BoundField DataField="idRH_Gestor" HeaderText="idRH_Gestor" 
                                                    SortExpression="idRH_Gestor" Visible="False" />
                                                <asp:BoundField DataField="idCadastroEmpresa" HeaderText="idCadastroEmpresa" 
                                                    SortExpression="idCadastroEmpresa" Visible="False" />
                                                <asp:BoundField DataField="idCadastroEmpresa_Filha" 
                                                    HeaderText="idCadastroEmpresa_Filha" SortExpression="idCadastroEmpresa_Filha" 
                                                    Visible="False" />
                                                <asp:BoundField DataField="dsfuncao" HeaderText="dsfuncao" 
                                                    SortExpression="dsfuncao" Visible="False" />
                                                <asp:BoundField DataField="idVaga" HeaderText="idVaga" SortExpression="idVaga" 
                                                    Visible="False" />
                                                <asp:BoundField DataField="encerrado" HeaderText="encerrado" 
                                                    SortExpression="encerrado" Visible="False" />
                                                <asp:BoundField DataField="intervaloDataINI" HeaderText="intervaloDataINI" 
                                                    SortExpression="intervaloDataINI" Visible="False" />
                                                <asp:BoundField DataField="intervaloDataFIM" HeaderText="intervaloDataFIM" 
                                                    SortExpression="intervaloDataFIM" Visible="False" />
                                                <asp:BoundField DataField="mediaData" HeaderText="mediaData" 
                                                    SortExpression="mediaData" Visible="False" />
                                                <asp:BoundField DataField="PSAtrazado" HeaderText="PSAtrazado" 
                                                    SortExpression="PSAtrazado" Visible="False" />
                                                <asp:BoundField DataField="TextButtonFase" HeaderText="Status" 
                                                    SortExpression="TextButtonFase" Visible="False" />
                                                <asp:TemplateField HeaderText="Status" ShowHeader="False">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                                            CommandName="Select" Enabled='<%# Eval("Habilita") %>' 
                                                            Text='<%# Eval("TextButtonFase") %>'></asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </td>
                                </tr>
                            </table>
                    </asp:Panel>
                                        <table ID="Legenda" runat="server" visible="false" align="left" cellpadding="5" cellspacing="0">
                                            <tr>
                                                <td>
                                                    <asp:Image ID="ImageLegenda0" runat="server" 
                                                        ImageUrl="~/images/empresa/aok.png" />
                                                </td>
                                                <td>
                                                    <asp:Label ID="LabelLegenda0" runat="server" Font-Italic="True" 
                                                        Text="Inicia hoje"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Image ID="ImageLegenda1" runat="server" 
                                                        ImageUrl="~/images/empresa/nok.png" />
                                                </td>
                                                <td>
                                                    <asp:Label ID="LabelLegenda1" runat="server" Font-Italic="True" 
                                                        Text="Data vencida"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Image ID="ImageLegenda2" runat="server" 
                                                        ImageUrl="~/images/empresa/ok.png" />
                                                </td>
                                                <td>
                                                    <asp:Label ID="LabelLegenda2" runat="server" Font-Italic="True" 
                                                        Text="Data no prazo"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Image ID="ImageLegenda3" runat="server" 
                                                        ImageUrl="~/images/empresa/iok.png" />
                                                </td>
                                                <td>
                                                    <asp:Label ID="LabelLegenda3" runat="server" Font-Italic="True" Text="Iniciado"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Image ID="ImageLegenda4" runat="server" 
                                                        ImageUrl="~/images/empresa/fok.png" />
                                                </td>
                                                <td>
                                                    <asp:Label ID="LabelLegenda4" runat="server" Font-Italic="True" 
                                                        Text="Finalizado"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                    <br />
                    <br />
                    <br />
                    <asp:Label ID="LabelCabec0" runat="server" CssClass="tituloEmpresa" 
                        Visible="False">Candidataram-se pelo site</asp:Label>
                    <br />
                    <asp:Panel ID="PanelCandidaturaEx" runat="server" Visible="False">
                        <asp:GridView ID="GridViewExpontaneo" runat="server" 
                            AutoGenerateColumns="False" BorderColor="#CCCCCC" BorderStyle="Dotted" 
                            BorderWidth="1px" DataKeyNames="idcurriculo,idUser,idRELcandidato_vaga" 
                            DataSourceID="SqlExpontaneo" GridLines="Horizontal" Width="100%" 
                            Visible="False">
                            <Columns>
                                <asp:ButtonField ButtonType="Image" CommandName="Select" 
                                    ImageUrl="~/images/candidato/bvcv.png" Text="Button">
                                <ItemStyle Width="28px" />
                                </asp:ButtonField>
                                <asp:BoundField DataField="nome" HeaderText="Candidato" SortExpression="nome" />
                                <asp:BoundField DataField="idRELcandidato_vaga" 
                                    HeaderText="idRELcandidato_vaga" InsertVisible="False" ReadOnly="True" 
                                    SortExpression="idRELcandidato_vaga" Visible="False" />
                                <asp:BoundField DataField="idvaga" HeaderText="idvaga" SortExpression="idvaga" 
                                    Visible="False" />
                                <asp:BoundField DataField="idcurriculo" HeaderText="idcurriculo" 
                                    SortExpression="idcurriculo" Visible="False" />
                                <asp:BoundField DataField="Protocolo" HeaderText="Protocolo" 
                                    SortExpression="Protocolo" Visible="False" />
                                <asp:BoundField DataField="apresentacao" HeaderText="apresentacao" 
                                    SortExpression="apresentacao" Visible="False" />
                                <asp:BoundField DataField="liberarCandidato" HeaderText="liberarCandidato" 
                                    SortExpression="liberarCandidato" Visible="False" />
                                <asp:BoundField DataField="contador" HeaderText="contador" 
                                    SortExpression="contador" Visible="False" />
                                <asp:BoundField DataField="data" DataFormatString="{0:d}" 
                                    HeaderText="Candidatou-se em:" SortExpression="data" />
                                <asp:BoundField DataField="comentarioCV" HeaderText="comentarioCV" 
                                    SortExpression="comentarioCV" Visible="False" />
                                <asp:BoundField DataField="pontuacao" HeaderText="pontuacao" 
                                    SortExpression="pontuacao" Visible="False" />
                                <asp:BoundField DataField="idUser" HeaderText="idUser" InsertVisible="False" 
                                    SortExpression="idUser" Visible="False" />
                            </Columns>
                            <EmptyDataTemplate>
                                <asp:Label ID="AvisoCandidatoA" runat="server" 
                                    Text="Não existem CVs espontâneos na base"></asp:Label>
                            </EmptyDataTemplate>
                        </asp:GridView>
                    </asp:Panel>
                    <br />
                    <asp:Label ID="LabelCabec2" runat="server" CssClass="tituloEmpresa" 
                        Visible="False">Indicações solicitadas</asp:Label>
                    <br />
                    <asp:GridView ID="GridViewIndica" runat="server" AutoGenerateColumns="False" 
                        BorderColor="#CCCCCC" BorderStyle="Dotted" BorderWidth="1px" 
                        DataKeyNames="idCVIndicado,idCurriculo,idUser" DataSourceID="SqlIndicacoes" 
                        GridLines="Horizontal" Visible="False" Width="100%">
                        <AlternatingRowStyle BackColor="#EBEBEB" />
                        <Columns>
                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                    <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" 
                                        CommandName="Select" Enabled='<%# Eval("idCurriculo") %>' 
                                        ImageUrl="~/images/candidato/bvcv.png" Text="Button" />
                                </ItemTemplate>
                                <ItemStyle Width="28px" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="idCVIndicado" HeaderText="idCVIndicado" 
                                InsertVisible="False" ReadOnly="True" SortExpression="idCVIndicado" 
                                Visible="False" />
                            <asp:BoundField DataField="idCadastroEmpresa" HeaderText="idCadastroEmpresa" 
                                SortExpression="idCadastroEmpresa" Visible="False" />
                            <asp:BoundField DataField="idCadastroEmpresaFilha" 
                                HeaderText="idCadastroEmpresaFilha" SortExpression="idCadastroEmpresaFilha" 
                                Visible="False" />
                            <asp:BoundField DataField="idVaga" HeaderText="idVaga" SortExpression="idVaga" 
                                Visible="False" />
                            <asp:BoundField DataField="idCurriculo" HeaderText="idCurriculo" 
                                SortExpression="idCurriculo" Visible="False" />
                            <asp:BoundField DataField="protocoloInd" HeaderText="Protocolo Indicação" 
                                SortExpression="protocoloInd" />
                            <asp:BoundField DataField="cpf" HeaderText="CPF" SortExpression="cpf" />
                            <asp:BoundField DataField="nome" HeaderText="Candidato" SortExpression="nome" />
                            <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" 
                                Visible="False" />
                            <asp:BoundField DataField="mensagem" HeaderText="mensagem" 
                                SortExpression="mensagem" Visible="False" />
                            <asp:BoundField DataField="data" HeaderText="data" SortExpression="data" 
                                Visible="False" />
                            <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" 
                                Visible="False" />
                            <asp:BoundField DataField="idUser" HeaderText="idUser" SortExpression="idUser" 
                                Visible="False" />
                        </Columns>
                        <EmptyDataTemplate>
                            <asp:Label ID="AvisoCandidatoA" runat="server" 
                                Text="Não existem CVs indicados para este processo seletivo"></asp:Label>
                        </EmptyDataTemplate>
                    </asp:GridView>
                    <br />
                    <br />
                    <asp:Panel ID="PanelRun" runat="server">
                        <asp:ImageButton ID="ImageButtonXML" runat="server" 
                            ImageUrl="~/images/empresa/btPesquisaCVs.png" Visible="False" />
                        <asp:ImageButton ID="ImageButtonEncerrar" runat="server" 
                            ImageUrl="~/images/empresa/btEncerraFase.png" Visible="False" 
                            onclientclick="return confirm(&quot;Quer realmente encerrar esta fase?&quot;)" />
                        <br />
                        <br />
                        <asp:Label ID="LabelCabec1" runat="server" CssClass="tituloEmpresa" 
                            Visible="False">Resultado da pesquisa</asp:Label>
                        <asp:GridView ID="GridViewResPesquisa" runat="server" 
                            AutoGenerateColumns="False" BorderColor="#CCCCCC" BorderStyle="Dotted" 
                            BorderWidth="1px" DataKeyNames="idcurriculo,idUser" GridLines="Horizontal" 
                            ShowHeader="False" Width="100%">
                            <AlternatingRowStyle BackColor="#EBEBEB" />
                            <Columns>
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="false" 
                                            CommandName="Select" ImageUrl="~/images/candidato/bvcv.png" Text="Button" />
                                    </ItemTemplate>
                                    <ItemStyle Width="28px" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="idcurriculo" Visible="False" />
                                <asp:BoundField DataField="nome" />
                                <asp:BoundField DataField="idUser" Visible="False" />
                            </Columns>
                            <EmptyDataTemplate>
                                <asp:Label ID="AvisoCandidatoA" runat="server" 
                                    Text="A pesquisa com os filtros informados não retornou resultado."></asp:Label>
                            </EmptyDataTemplate>
                        </asp:GridView>
                        <br />
                        <asp:Label ID="idUserLabel" runat="server" Visible="False"></asp:Label>
                        <asp:Label ID="idcurriculoLabel" runat="server" Visible="False"></asp:Label>
                        <br />
                    </asp:Panel>
                    <br />     
                </td>
            </tr>
        </table>
                <asp:Label ID="emailCandidatoLabel" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="nomeCandidatoLabel" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="idProcessoSeletivoLabel" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="idCadastroEmpresaFilhaLabel" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="protocoloLabel" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="idTipoFaseProcessoSeletivoLabel" runat="server" 
            Visible="False"></asp:Label>
                <asp:Label ID="idVagaLabel" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="idRH_GestorLabel" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="idFaseProcessoSeletivoLabel" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="idFaseProcessoSeletivoCandidatoLabel" runat="server" 
            Visible="False"></asp:Label>
                <br />
        <asp:Label ID="idRELcandidato_vagaLabel" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="idCalendarioLabel" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="HorainiLabel" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="CalendarCandidatoLabel" runat="server" Visible="False"></asp:Label>
        <br />
        <asp:Panel ID="PanelCV" runat="server" Visible="False" BackColor="White" 
            CssClass="CVPosition">
            <table cellpadding="0" cellspacing="0" style="width: 100%">
                <tr>
                    <td align="right">
                        <asp:ImageButton ID="ImageButtonPanel" runat="server" 
                            ImageUrl="~/images/fecharportifolio.gif" CausesValidation="False" />
                    </td>
                </tr>
            </table>
            <table id="FaseInf" cellpadding="5" cellspacing="5" style="width: 100%">
                <tr>
                    <td align="left">
                        <table ID="MenuAction" cellpadding="0" cellspacing="0">
                            <tr>
                                <td>
                                    <asp:ImageButton ID="ImageButtonEMAILC" runat="server" CausesValidation="False" 
                                        ImageUrl="~/images/empresa/PS_Email_BT.png" />
                                    <cc1:ModalPopupExtender ID="ImageButtonEMAILC_ModalPopupExtender" 
                                        runat="server" CancelControlID="ImageButtonCloseEmail" DynamicServicePath="" 
                                        Enabled="True" PopupControlID="PanelEnviarEmailC" 
                                        TargetControlID="ImageButtonEMAILC">
                                    </cc1:ModalPopupExtender>
                                </td>
                                <td>
                                    <asp:ImageButton ID="ImageButtonAPROVADOC" runat="server" 
                                        CausesValidation="False" ImageUrl="~/images/empresa/PS_Aprovado_BT.png" />
                                    <cc1:ModalPopupExtender ID="ImageButtonAPROVADOC_ModalPopupExtender" 
                                        runat="server" CancelControlID="ImageButtonCancelFormAvalia" 
                                        DynamicServicePath="" Enabled="True" PopupControlID="PanelAvaliacao" 
                                        TargetControlID="ImageButtonAPROVADOC">
                                    </cc1:ModalPopupExtender>
                                </td>
                                <td>
                                    <asp:ImageButton ID="ImageButtonAGENDAC" runat="server" 
                                        CausesValidation="False" ImageUrl="~/images/empresa/PS_Agenda_BT.png" 
                                        Visible="False" />
                                </td>
                                <td>
                                    <asp:ImageButton ID="ImageButtonREPROVADOC" runat="server" 
                                        CausesValidation="False" ImageUrl="~/images/empresa/PS_Reprovado_BT.png" 
                                        onclientclick="return confirm(&quot;Quer retirar este Candidato da candidatura espontânea?&quot;)" />
                                </td>
                                <td>
                                    <asp:ImageButton ID="ImageButtonImprimir" runat="server" 
                                        CausesValidation="False" ImageUrl="~/images/empresa/PS_Imprimir_BT.png" />
                                </td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                        </table>
                        <asp:Panel ID="PanelEnviarEmailC" runat="server" BackColor="#FFFFEC" 
                            Width="500px">
                            <table ID="EnviaMensagem" cellpadding="5" cellspacing="5" width="100%">
                                <tr>
                                    <td>
                                        <table ID="CloseTB" cellpadding="0" cellspacing="0" width="100%">
                                            <tr>
                                                <td align="right">
                                                    <asp:ImageButton ID="ImageButtonCloseEmail" runat="server" 
                                                        CausesValidation="False" ImageUrl="~/images/close.png" />
                                                </td>
                                            </tr>
                                        </table>
                                        <br />
                                        <asp:Label ID="LabelCabecFase1" runat="server" CssClass="tituloEmpresa">Enviar uma mensagem ao profissional:</asp:Label>
                                        <br />
                                        <asp:Label ID="msnEmailCandidato" runat="server" CssClass="msn"></asp:Label>
                                        <br />
                                        <asp:Label ID="msgLabel" runat="server" Text="Escreva a mensagem:"></asp:Label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                            ControlToValidate="msgTextBox" 
                                            ErrorMessage="* Escreva a mensagem para o profissional" 
                                            ValidationGroup="msgProf">*</asp:RequiredFieldValidator>
                                        <br />
                                        <asp:TextBox ID="msgTextBox" runat="server" CssClass="InputCad" Height="100px" 
                                            TextMode="MultiLine" ValidationGroup="msgProf"></asp:TextBox>
                                        <br />
                                        <asp:ValidationSummary ID="ValidationSummarymsg" runat="server" 
                                            ShowMessageBox="True" ShowSummary="False" ValidationGroup="msgProf" />
                                        <asp:ImageButton ID="ImageButtonEnviar" runat="server" 
                                            ImageUrl="~/images/empresa/btENVIARMENSAGEM.gif" ValidationGroup="msgProf" />
                                        <asp:ImageButton ID="ImageButtonFecharEnviaEmail" runat="server" 
                                            CausesValidation="False" ImageUrl="~/images/empresa/btCancelarAction.png" />
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                        <asp:Panel ID="PanelAvaliacao" runat="server" BackColor="#FFFFEC" Width="500px">
                            <table ID="AvaliaTable" cellpadding="5" cellspacing="5">
                                <tr>
                                    <td align="right">
                                        <asp:ImageButton ID="ImageButtonCancelFormAvalia" runat="server" 
                                            CausesValidation="False" ImageUrl="~/images/close.png" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:ImageButton ID="ImageButtonAP" runat="server" CausesValidation="False" 
                                            ImageUrl="~/images/empresa/PS_APessoal_BT.png" />
                                        <cc1:DropDownExtender ID="ImageButtonAP_DropDownExtender" runat="server" 
                                            DropDownControlID="PanelApresentaPessoal" DynamicServicePath="" Enabled="True" 
                                            TargetControlID="ImageButtonAP">
                                        </cc1:DropDownExtender>
                                        <asp:Panel ID="PanelApresentaPessoal" runat="server">
                                            <asp:DataList ID="DataListEspontaneo" runat="server" 
                                                DataKeyField="idRELcandidato_vaga" DataSourceID="SqlCVEspontaneoAp" 
                                                Width="480px">
                                                <ItemTemplate>
                                                    <table ID="Espontaneo" bgcolor="#FFFFD9" cellpadding="5" cellspacing="5" 
                                                        width="100%">
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="ProtocoloLabel" runat="server" Font-Bold="True" 
                                                                    Text='<%# Eval("Protocolo") %>' />
                                                                <br />
                                                                <br />
                                                                <asp:Label ID="ApreLabel" runat="server" Font-Bold="True" 
                                                                    Text="Apresentação pessoal:"></asp:Label>
                                                                <br />
                                                                <asp:Label ID="apresentacaoLabel" runat="server" 
                                                                    Text='<%# Eval("apresentacao") %>' />
                                                                <br />
                                                                <br />
                                                                <asp:Label ID="DataApLabel" runat="server" Font-Bold="True" 
                                                                    Text="Data da candidatura:"></asp:Label>
                                                                <br />
                                                                <asp:Label ID="dataLabel" runat="server" Text='<%# Eval("data") %>' />
                                                                <br />
                                                                <br />
                                                                <asp:ImageButton ID="ImageButtonLiberaCandidato" runat="server" 
                                                                    CommandName="Select" ImageUrl="~/images/empresa/btLIBERACANDIDATO.gif" 
                                                                    onclientclick="return confirm(&quot;Quer liberar este CV do processo seletivo?&quot;)" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </ItemTemplate>
                                            </asp:DataList>
                                            <br />
                                        </asp:Panel>
                                        <br />
                                        <asp:Label ID="LabelCabecFase" runat="server" CssClass="tituloEmpresa">Análise sobre o profissional</asp:Label>
                                        <br />
                                        <asp:Label ID="Label48" runat="server" 
                                            Text="Utilize as ferramentas abaixo para avaliar o profissional."></asp:Label>
                                        <br />
                                        <asp:FormView ID="FormView1" runat="server" 
                                            DataKeyNames="idFaseProcessoSeletivoCV" DataSourceID="SqlSelecionarCV" 
                                            Width="480px" DefaultMode="Edit">
                                            <EditItemTemplate>
                                                <asp:Label ID="LabelCabecFase0" runat="server" CssClass="tituloEmpresa">Alterar informações sobre o profissional</asp:Label>
                                                <br />
                                                <asp:Label ID="Label49" runat="server" Text="Comentário sobre este CV:"></asp:Label>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                                    ControlToValidate="comentarioTextBox" 
                                                    ErrorMessage="Seu comentário é importante para seguir com as fases do processo.">*</asp:RequiredFieldValidator>
                                                <br />
                                                <asp:TextBox ID="comentarioTextBox" runat="server" CssClass="InputCad" 
                                                    Height="120px" Text='<%# Bind("comentario") %>' TextMode="MultiLine" />
                                                <br />
                                                <asp:Label ID="Label50" runat="server" Text="Qual pontuação você dá a este CV?"></asp:Label>
                                                <br />
                                                <asp:DropDownList ID="DropDownListPontos" runat="server" CssClass="DropCad" 
                                                    DataSourceID="SqlPontuacao" DataTextField="pontuacao" 
                                                    DataValueField="pontuacao" SelectedValue='<%# Bind("pontuacao") %>'>
                                                </asp:DropDownList>
                                                <br />
                                                <asp:RadioButtonList ID="RadioButtonList1" runat="server" 
                                                    SelectedValue='<%# Bind("flgAprovado", "{0}") %>'>
                                                    <asp:ListItem Value="1">Aprovado na Fase.</asp:ListItem>
                                                    <asp:ListItem Value="0">Em análise.</asp:ListItem>
                                                    <asp:ListItem Value="2">Aguardando posição do candidato.</asp:ListItem>
                                                    <asp:ListItem Value="3">Reprovado na Fase.</asp:ListItem>
                                                </asp:RadioButtonList>
                                                <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                                                    ShowMessageBox="True" ShowSummary="False" />
                                                <br />
                                                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                                                    CommandName="Update" Text="Atualizar seus comentários" />
                                                &nbsp;|&nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                                                    CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
                                            </EditItemTemplate>
                                            <EmptyDataTemplate>
                                                <asp:Label ID="LabelCabecFase0" runat="server" CssClass="tituloEmpresa">Selecionar este profissional:</asp:Label>
                                                <br />
                                                <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                                                    CommandName="New" onload="NewButton_Load" 
                                                    Text="Desejo selecionar este profissional" />
                                            </EmptyDataTemplate>
                                            <InsertItemTemplate>
                                                <asp:Label ID="LabelCabecFase0" runat="server" CssClass="tituloEmpresa">Incluir no Processo Seletivo</asp:Label>
                                                <br />
                                                <asp:Label ID="Label49" runat="server" 
                                                    Text="Comentário sobre este Profissional:"></asp:Label>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                                    ControlToValidate="comentarioTextBox" 
                                                    ErrorMessage="Seu comentário é importante para seguir com as fases do processo.">*</asp:RequiredFieldValidator>
                                                <br />
                                                <asp:TextBox ID="comentarioTextBox" runat="server" CssClass="InputCad" 
                                                    Height="120px" Text='<%# Bind("comentario") %>' TextMode="MultiLine" />
                                                <br />
                                                <asp:Label ID="Label50" runat="server" 
                                                    Text="Qual pontuação você dá a este Profissional?"></asp:Label>
                                                <br />
                                                <asp:DropDownList ID="DropDownListPontos" runat="server" CssClass="DropCad" 
                                                    DataSourceID="SqlPontuacao" DataTextField="pontuacao" 
                                                    DataValueField="pontuacao" SelectedValue='<%# Bind("pontuacao") %>'>
                                                </asp:DropDownList>
                                                <br />
                                                <asp:RadioButtonList ID="RadioButtonList1" runat="server" 
                                                    SelectedValue='<%# Bind("flgAprovado", "{0}") %>'>
                                                    <asp:ListItem Value="1" Selected="True">Aprovado na Fase.</asp:ListItem>
                                                    <asp:ListItem Value="0">Em análise.</asp:ListItem>
                                                    <asp:ListItem Value="2">Aguardando posição do candidato.</asp:ListItem>
                                                    <asp:ListItem Value="3">Reprovado na Fase.</asp:ListItem>
                                                </asp:RadioButtonList>
                                                <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                                                    ShowMessageBox="True" ShowSummary="False" />
                                                <asp:ImageButton ID="ImageButton2" runat="server" CommandName="Insert" 
                                                    ImageUrl="~/images/empresa/btSelecionarAction.png" />
                                                <asp:ImageButton ID="ImageButtonCancelaAvaliador" runat="server" 
                                                    CausesValidation="False" CommandName="Cancel" 
                                                    ImageUrl="~/images/empresa/btCancelarAction.png" />
                                                <br />
                                            </InsertItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="LabelCabecFase0" runat="server" CssClass="tituloEmpresa">Informações sobre o profissional:</asp:Label>
                                                <br />
                                                <asp:Label ID="comentarioLabel" runat="server" 
                                                    Text='<%# Bind("comentario") %>' />
                                                <br />
                                                <asp:Label ID="pontuacaoLabel" runat="server" Text='<%# Bind("pontuacao") %>' />
                                                <asp:Label ID="LabelPontos" runat="server" Text=" Pontos"></asp:Label>
                                                <br />
                                                <br />
                                                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                                                    CommandName="Edit" Text="Editar dados da seleção" />
                                                &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                                                    CommandName="Delete" 
                                                    onclientclick="return confirm(&quot;Quer excluir este CV da fase?&quot;)" 
                                                    Text="Excluir CV" />
                                                &nbsp;
                                            </ItemTemplate>
                                        </asp:FormView>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                        <asp:SqlDataSource ID="SqlSelecionarCV" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                            DeleteCommand="_USP_PROCESSOSELETIVO_FASE_CANDIDATO_DELETE" 
                            InsertCommand="_USP_PROCESSOSELETIVO_FASE_CANDIDATO_INSERT" 
                            SelectCommand="_USP_PROCESSOSELETIVO_FASE_CANDIDATO_SELECT" 
                            UpdateCommand="_USP_PROCESSOSELETIVO_FASE_CANDIDATO_UPDATE" 
                            DeleteCommandType="StoredProcedure" InsertCommandType="StoredProcedure" 
                            SelectCommandType="StoredProcedure" UpdateCommandType="StoredProcedure">
                            <DeleteParameters>
                                <asp:Parameter Name="idFaseProcessoSeletivoCV" Type="Int32" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="idcurriculo" Type="Int32" />
                                <asp:Parameter Name="idFaseProcessoSeletivo" Type="Int32" />
                                <asp:Parameter Name="comentario" Type="String" />
                                <asp:Parameter Name="pontuacao" Type="Decimal" />
                                <asp:Parameter Name="flgAprovado" Type="Int32" />
                                <asp:Parameter Name="idvaga" Type="Int32" />
                            </InsertParameters>
                            <SelectParameters>
                                <asp:ControlParameter ControlID="idcurriculoLabel" Name="idcurriculo" 
                                    PropertyName="Text" Type="Int32" />
                                <asp:ControlParameter ControlID="idFaseProcessoSeletivoLabel" 
                                    Name="idFaseProcessoSeletivo" PropertyName="Text" />
                            </SelectParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="idcurriculo" Type="Int32" />
                                <asp:Parameter Name="idFaseProcessoSeletivo" Type="Int32" />
                                <asp:Parameter Name="comentario" Type="String" />
                                <asp:Parameter Name="pontuacao" Type="Decimal" />
                                <asp:Parameter Name="flgAprovado" Type="Int32" />
                                <asp:Parameter Name="idFaseProcessoSeletivoCV" Type="Int32" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlCVEspontaneoAp" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                            SelectCommand="SELECT * FROM [_tbRel_vaga_candidato] WHERE (([idcurriculo] = @idcurriculo) AND ([idvaga] = @idvaga) AND ([Protocolo] = @Protocolo))">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="idcurriculoLabel" Name="idcurriculo" 
                                    PropertyName="Text" Type="Int32" />
                                <asp:ControlParameter ControlID="idVagaLabel" Name="idvaga" PropertyName="Text" 
                                    Type="Int32" />
                                <asp:ControlParameter ControlID="protocoloLabel" Name="Protocolo" 
                                    PropertyName="Text" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlPontuacao" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                            SelectCommand="SELECT [pontuacao] FROM [tbPontuacao]"></asp:SqlDataSource>
                        <br />
                        <asp:SqlDataSource ID="SqlDataAgenda" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                            
                            SelectCommand="_USP_AGENDA_CONSULTOR_X_CANDIDATO_CONVITE" 
                            SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="idCadastroEmpresa" SessionField="idCadastroEmpresa" 
                                    Type="Int32" />
                                <asp:SessionParameter Name="idRH_Gestor" SessionField="idRH_Gestor" 
                                    Type="Int32" />
                                <asp:ControlParameter ControlID="idcurriculoLabel" Name="idCurriculo" 
                                    PropertyName="Text" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlDataAgendaForm" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                            DeleteCommand="DELETE FROM [tbAgendaC] WHERE [idCalendario] = @idCalendario" 
                            InsertCommand="INSERT INTO tbAgendaC(idCadastroEmpresa, idRH_Gestor, idUser, idCurriculo, idEventoAgenda, idProcessoSeletivo, idFaseProcessoSeletivoCV, DataStartField, DataEndField, DataTextField, DataValueField, Evento, dsEventoAceite, aceito, Protocolo, vaga) VALUES (@idCadastroEmpresa, @idRH_Gestor, @idUser, @idCurriculo, @idEventoAgenda, @idProcessoSeletivo, @idFaseProcessoSeletivoCV, @DataStartField, @DataEndField, @DataTextField, @DataValueField, @Evento, @dsEventoAceite, @aceito, @Protocolo, @vaga)" 
                            SelectCommand="SELECT [idCalendario], [idCadastroEmpresa], [idRH_Gestor], [idUser], [idCurriculo], [idEventoAgenda], [idProcessoSeletivo], [idFaseProcessoSeletivoCV], [DataStartField], [DataEndField], [DataTextField], [DataValueField], [Evento], [dsEventoAceite], [aceito] FROM [tbAgendaC] WHERE (([idRH_Gestor] = @idRH_Gestor) AND ([idCadastroEmpresa] = @idCadastroEmpresa) AND ([idCurriculo] = @idCurriculo) AND ([idCalendario] = @idCalendario))" 
                            
                            
                            UpdateCommand="UPDATE [tbAgendaC] SET [idCadastroEmpresa] = @idCadastroEmpresa, [idRH_Gestor] = @idRH_Gestor, [idUser] = @idUser, [idCurriculo] = @idCurriculo, [idEventoAgenda] = @idEventoAgenda, [idProcessoSeletivo] = @idProcessoSeletivo, [idFaseProcessoSeletivoCV] = @idFaseProcessoSeletivoCV, [DataStartField] = @DataStartField, [DataEndField] = @DataEndField, [DataTextField] = @DataTextField, [DataValueField] = @DataValueField, [Evento] = @Evento, [dsEventoAceite] = @dsEventoAceite, [aceito] = @aceito WHERE [idCalendario] = @idCalendario">
                            <SelectParameters>
                                <asp:SessionParameter Name="idRH_Gestor" SessionField="idRH_Gestor" 
                                    Type="Int32" />
                                <asp:SessionParameter Name="idCadastroEmpresa" SessionField="idCadastroEmpresa" 
                                    Type="Int32" />
                                <asp:ControlParameter ControlID="idcurriculoLabel" Name="idCurriculo" 
                                    PropertyName="Text" Type="Int32" />
                                <asp:ControlParameter ControlID="idCalendarioLabel" Name="idCalendario" 
                                    PropertyName="Text" Type="Int32" />
                            </SelectParameters>
                            <DeleteParameters>
                                <asp:Parameter Name="idCalendario" Type="Int32" />
                            </DeleteParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="idCadastroEmpresa" Type="Int32" />
                                <asp:Parameter Name="idRH_Gestor" Type="Int32" />
                                <asp:Parameter Name="idUser" Type="Int32" />
                                <asp:Parameter Name="idCurriculo" Type="Int32" />
                                <asp:Parameter Name="idEventoAgenda" Type="Int32" />
                                <asp:Parameter Name="idProcessoSeletivo" Type="Int32" />
                                <asp:Parameter Name="idFaseProcessoSeletivoCV" Type="Int32" />
                                <asp:Parameter Name="DataStartField" Type="DateTime" />
                                <asp:Parameter Name="DataEndField" Type="DateTime" />
                                <asp:Parameter Name="DataTextField" Type="String" />
                                <asp:Parameter Name="DataValueField" Type="String" />
                                <asp:Parameter Name="Evento" Type="String" />
                                <asp:Parameter Name="dsEventoAceite" Type="String" />
                                <asp:Parameter Name="aceito" Type="Int32" />
                                <asp:Parameter Name="idCalendario" Type="Int32" />
                            </UpdateParameters>
                            <InsertParameters>
                                <asp:Parameter Name="idCadastroEmpresa" Type="Int32" />
                                <asp:Parameter Name="idRH_Gestor" Type="Int32" />
                                <asp:Parameter Name="idUser" Type="Int32" />
                                <asp:Parameter Name="idCurriculo" Type="Int32" />
                                <asp:Parameter Name="idEventoAgenda" Type="Int32" />
                                <asp:Parameter Name="idProcessoSeletivo" Type="Int32" />
                                <asp:Parameter Name="idFaseProcessoSeletivoCV" Type="Int32" />
                                <asp:Parameter Name="DataStartField" Type="DateTime" />
                                <asp:Parameter Name="DataEndField" Type="DateTime" />
                                <asp:Parameter Name="DataTextField" Type="String" />
                                <asp:Parameter Name="DataValueField" Type="String" />
                                <asp:Parameter Name="Evento" Type="String" />
                                <asp:Parameter Name="dsEventoAceite" Type="String" />
                                <asp:Parameter Name="aceito" Type="Int32" />
                                <asp:Parameter Name="Protocolo" />
                                <asp:Parameter Name="vaga" />
                            </InsertParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
            </table>
            <table cellpadding="0" cellspacing="0" width="600">
                <tr>
                    <td width="600">
                        <table border="0" cellpadding="0" cellspacing="0" width="600">
                            <tr>
                                <td height="131" valign="top" width="135" align="right">
                                    <br />
                            <br />
                                    <asp:Image ID="ImageCV" runat="server" ImageUrl="~/images/cvnoImage.png" 
                                        Width="120px" />
                                    <asp:Image ID="ImageDef" runat="server" 
                                        ImageUrl="~/images/candidato/cv/deficienteT.gif" 
                                        ToolTip="Pessoa com necessidades especiais." Visible="False" />
                                </td>
                                <td valign="top" width="465">
                                    <br />
                                    <table cellpadding="0" cellspacing="0" width="465">
                                        <tr>
                                            <td width="10" valign="top">
                                                &nbsp;</td>
                                            <td width="439">
                                                <asp:DataList ID="DataList1" runat="server" DataKeyField="idCadastroUser" 
                                                    DataSourceID="SqlDataSource1" Width="420px">
                                                    <ItemTemplate>
                                                        <table ID="DadosINT" cellpadding="5" cellspacing="0" width="465">
                                                            <tr>
                                                                <td valign="top" width="439">
                                                                    <asp:Image ID="Image1" runat="server" 
                                                                        ImageUrl="~/images/candidato/cv/titdadospessoais.gif" />
                                                                    <br />
                                                                    <asp:Label ID="idCadastroUserLabel" runat="server" 
                                                                        Text='<%# Eval("idCadastroUser") %>' Visible="False"></asp:Label>
                                                                    <br />
                                                                    <asp:Label ID="Label1" runat="server" CssClass="cur01st" Text="Nome:"></asp:Label>
                                                                    &nbsp;<br />
                                                                    <asp:Label ID="nomeLabel" runat="server" CssClass="cur01" 
                                                                        Text='<%# Eval("nome") %>'></asp:Label>
                                                                    <br />
                                                                    <asp:Label ID="Label2" runat="server" CssClass="cur01st" Text="Endereço: "></asp:Label>
                                                                    &nbsp;<br />
                                                                    <asp:Label ID="enderecoLabel" runat="server" CssClass="cur01" 
                                                                        Text='<%# Eval("endereco") %>'></asp:Label>
                                                                    &nbsp;<br />
                                                                    <asp:Label ID="bairroLabel" runat="server" CssClass="cur01" 
                                                                        Text='<%# Eval("bairro") %>'></asp:Label>
                                                                    -
                                                                    <asp:Label ID="cidadeLabel" runat="server" CssClass="cur01" 
                                                                        Text='<%# Eval("cidade") %>'></asp:Label>
                                                                    /
                                                                    <asp:Label ID="ufLabel" runat="server" CssClass="cur01" 
                                                                        Text='<%# Eval("uf") %>'></asp:Label>
                                                                    -
                                                                    <asp:Label ID="paisLabel" runat="server" CssClass="cur01" 
                                                                        Text='<%# Eval("pais") %>'></asp:Label>
                                                                    <br />
                                                                    <asp:Label ID="Label3" runat="server" CssClass="cur01st" Text="CEP: "></asp:Label>
                                                                    <asp:Label ID="cepLabel" runat="server" CssClass="cur01" 
                                                                        Text='<%# Eval("cep") %>'></asp:Label>
                                                                    <br />
                                                                    <br />
                                                                    <asp:Label ID="emailCandidatoLabel" runat="server" CssClass="cur01st" 
                                                                        Text="E-mail:"></asp:Label>
                                                                    <br />
                                                                    <asp:Label ID="CandidatoEmailLabel" runat="server" CssClass="cur01" 
                                                                        Text='<%# Eval("email") %>'></asp:Label>
                                                                    <br />
                                                                    <br />
                                                                    <asp:Label ID="lblCabecContato" runat="server" CssClass="cur01st" 
                                                                        Text="Forma de contato:"></asp:Label>
                                                                    <br />
                                                                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                                                                        BorderStyle="None" DataKeyNames="idTipoTelefone" DataSourceID="SqlDataSource10" 
                                                                        GridLines="None" ShowHeader="False" CssClass="cur01">
                                                                        <Columns>
                                                                            <asp:TemplateField HeaderText="idTipoTelefone" SortExpression="idTipoTelefone">
                                                                                <EditItemTemplate>
                                                                                    <asp:Label ID="Label17" runat="server" Text='<%# Eval("idTipoTelefone") %>'></asp:Label>
                                                                                </EditItemTemplate>
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("idTipoTelefone") %>'></asp:Label>
                                                                                    <asp:Label ID="Doispontos" runat="server" CssClass="cur01" Text=": "></asp:Label>
                                                                                </ItemTemplate>
                                                                                <ItemStyle HorizontalAlign="Right" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="ddd" SortExpression="ddd">
                                                                                <EditItemTemplate>
                                                                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ddd") %>'></asp:TextBox>
                                                                                </EditItemTemplate>
                                                                                <ItemTemplate>
                                                                                    (<asp:Label ID="Label18" runat="server" Text='<%# Bind("ddd") %>'></asp:Label>
                                                                                    )
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="numero" SortExpression="numero">
                                                                                <EditItemTemplate>
                                                                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("numero") %>'></asp:TextBox>
                                                                                </EditItemTemplate>
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="Label19" runat="server" Text='<%# Bind("numero") %>'></asp:Label>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="ramal" SortExpression="ramal">
                                                                                <EditItemTemplate>
                                                                                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("ramal") %>'></asp:TextBox>
                                                                                </EditItemTemplate>
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="Label20" runat="server" Text='<%# Bind("ramal") %>'></asp:Label>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:BoundField DataField="idCadastroUser" HeaderText="idCadastroUser" 
                                                                                SortExpression="idCadastroUser" Visible="False" />
                                                                        </Columns>
                                                                        <EmptyDataTemplate>
                                                                            <asp:Label ID="lblContatoNull" runat="server" CssClass="cur01" 
                                                                                Text="Não informado."></asp:Label>
                                                                        </EmptyDataTemplate>
                                                                    </asp:GridView>
                                                                    <br />
                                                                    <br />
                                                                    <asp:Label ID="Label5" runat="server" CssClass="cur01st" 
                                                                        Text="Data de nascimento:"></asp:Label>
                                                                    <asp:Label ID="nascimentoLabel" runat="server" CssClass="cur01" 
                                                                        Text='<%# Eval("nascimento", "{0:d}") %>'></asp:Label>
                                                                    &nbsp;<br />
                                                                    <asp:Label ID="Label6" runat="server" CssClass="cur01st" Text="Sexo: "></asp:Label>
                                                                    <asp:Label ID="sexoLabel" runat="server" CssClass="cur01" 
                                                                        Text='<%# Eval("sexo") %>'></asp:Label>
                                                                    <br />
                                                                    <br />
                                                                    <asp:Label ID="Label7" runat="server" CssClass="cur01st" 
                                                                        Text="Cadastrado como: "></asp:Label>
                                                                    <asp:Label ID="cadastroTipoLabel" runat="server" CssClass="cur01" 
                                                                        Text='<%# Eval("cadastroTipo") %>'></asp:Label>
                                                                    <br />
                                                                    <br />
                                                                    <asp:Label ID="Label8" runat="server" CssClass="cur01st" Text="Estado civil: "></asp:Label>
                                                                    <asp:Label ID="estadocivilLabel" runat="server" CssClass="cur01" 
                                                                        Text='<%# Eval("estadocivil") %>'></asp:Label>
                                                                    <br />
                                                                    <asp:Label ID="Label9" runat="server" CssClass="cur01st" Text="Dependente(s): "></asp:Label>
                                                                    <asp:Label ID="nrdependenteLabel" runat="server" CssClass="cur01" 
                                                                        Text='<%# Eval("nrdependente") %>'></asp:Label>
                                                                    <br />
                                                                    <br />
                                                                    <asp:Label ID="Label10" runat="server" CssClass="cur01st" 
                                                                        Text="Resumo profissional:"></asp:Label>
                                                                    <br />
                                                                    <asp:Label ID="resumoLabel" runat="server" CssClass="cur01" 
                                                                        Text='<%# Eval("resumo") %>'></asp:Label>
                                                                    <br />
                                                                    <br />
                                                                    <asp:Label ID="Label11" runat="server" CssClass="cur01st" 
                                                                        Text="Remuneração atual: "></asp:Label>
                                                                    <br />
                                                                    <asp:Label ID="valorRemAtualLabel" runat="server" CssClass="cur01" 
                                                                        Text='<%# Eval("valorRemAtual", "{0:C}") %>'></asp:Label>
                                                                    <br />
                                                                    <asp:Label ID="Label12" runat="server" CssClass="cur01st" 
                                                                        Text="Remuneração pretendida: "></asp:Label>
                                                                    <br />
                                                                    <asp:Label ID="valorRemPretendidaLabel" runat="server" CssClass="cur01" 
                                                                        Text='<%# Eval("valorRemPretendida", "{0:C}") %>'></asp:Label>
                                                                    <br />
                                                                    <br />
                                                                    <asp:Label ID="Label13" runat="server" CssClass="cur01st" 
                                                                        Text="Deseja trabalhar em: "></asp:Label>
                                                                    <br />
                                                                    <asp:Label ID="localPreferenciaLabel" runat="server" CssClass="cur01" 
                                                                        Text='<%# Eval("localPreferencia") %>'></asp:Label>
                                                                    <br />
                                                                    <asp:Label ID="Label14" runat="server" CssClass="cur01st" 
                                                                        Text="Disponibilidade: "></asp:Label>
                                                                    <br />
                                                                    <asp:Label ID="disponibilidadeLabel" runat="server" CssClass="cur01" 
                                                                        Text='<%# Eval("disponibilidade") %>'></asp:Label>
                                                                    <br />
                                                                    <br />
                                                                    <asp:Label ID="Label15" runat="server" CssClass="cur01st" Text="Origem: "></asp:Label>
                                                                    <asp:Label ID="origemLabel" runat="server" CssClass="cur01" 
                                                                        Text='<%# Eval("origem") %>'></asp:Label>
                                                                    <br />
                                                                    <asp:Label ID="Label16" runat="server" CssClass="cur01st" 
                                                                        Text="Data do cadastro: "></asp:Label>
                                                                    <asp:Label ID="dataLabel" runat="server" CssClass="cur01" 
                                                                        Text='<%# Eval("data") %>'></asp:Label>
                                                                    <asp:Label ID="portadorDefLabel" runat="server" 
                                                                        Text='<%# Eval("portadorDef") %>' Visible="False"></asp:Label>
                                                                    <asp:Label ID="trabalhandoLabel" runat="server" 
                                                                        Text='<%# Eval("trabalhando") %>' Visible="False">
                                                </asp:Label>
                                                                    <asp:SqlDataSource ID="SqlDataSource10" runat="server" 
                                                                        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                                                                        SelectCommand="SELECT tbTelefone.ddd, tbTelefone.numero, tbTelefone.ramal, tbTipoTelefone.idTipoTelefone, tbTelefone.idCadastroUser FROM tbTelefone INNER JOIN tbTipoTelefone ON tbTelefone.idTipoTelefone = tbTipoTelefone.idTipoTelefone WHERE (tbTelefone.idCadastroUser = @idCadastroUser)">
                                                                        <SelectParameters>
                                                                            <asp:ControlParameter ControlID="idCadastroUserLabel" DefaultValue="0" 
                                                                                Name="idCadastroUser" PropertyName="Text" />
                                                                        </SelectParameters>
                                                                    </asp:SqlDataSource>
                                                                    <br />
                                                                </td>
                                                            </tr>
                                                            </td>
                                                        </table>
                                                    </ItemTemplate>
                                                </asp:DataList>
                                        <br />
                                                <asp:DataList ID="DataListSumario" runat="server" DataSourceID="SqlDataSource3">
                                                    <ItemTemplate>
                                                <br />
                                                <br />
                                                        <asp:Image ID="Image3" runat="server" 
                                                            ImageUrl="~/images/candidato/cv/titobjetivo.gif" />
                                                        <br />
                                                        <asp:Label ID="Label17" runat="server" CssClass="cur01st" Text="Apresentacao:"></asp:Label>
                                                        <br />
                                                        <asp:Label ID="apresentacaoLabel" runat="server" CssClass="cur01" 
                                                            Text='<%# Eval("apresentacao") %>'></asp:Label>
                                                        <br />
                                                <br />
                                                        <asp:Label ID="Label18" runat="server" CssClass="cur01st" Text="Realizações:"></asp:Label>
                                                        <br />
                                                        <asp:Label ID="realizacaoLabel" runat="server" CssClass="cur01" 
                                                            Text='<%# Eval("realizacao") %>'></asp:Label>
                                                        <br />
                                                <br />
                                                        <asp:Label ID="Label19" runat="server" CssClass="cur01st" Text="Resumo:"></asp:Label>
                                                        <br />
                                                        <asp:Label ID="resumogeralLabel" runat="server" CssClass="cur01" 
                                                            Text='<%# Eval("resumogeral") %>'></asp:Label>
                                                        <br />
                                                <br />
                                                        <asp:Label ID="Label20" runat="server" CssClass="cur01st" Text="Objetivo:"></asp:Label>
                                                        <br />
                                                        <asp:Label ID="objetivoLabel" runat="server" CssClass="cur01" 
                                                            Text='<%# Eval("objetivo") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:DataList>
                                                <asp:DataList ID="DataList4" runat="server" DataKeyField="estado" 
                                                    DataSourceID="SqlDataSource4" ShowFooter="False">
                                                    <ItemTemplate>
                                                        <asp:Label ID="dsinstituicaoLabel" runat="server" CssClass="cur01" 
                                                            Text='<%# Eval("dsinstituicao") %>'></asp:Label>
                                                        <asp:Label ID="idcurriculoLabel" runat="server" 
                                                            Text='<%# Eval("idcurriculo") %>' Visible="False"></asp:Label>
                                                        <br />
                                                        <asp:Label ID="estadoLabel" runat="server" CssClass="cur01" 
                                                            Text='<%# Eval("estado") %>'></asp:Label>
                                                        /
                                                        <asp:Label ID="ufLabel0" runat="server" CssClass="cur01" 
                                                            Text='<%# Eval("uf") %>'></asp:Label>
                                                        <br />
                                                <br />
                                                        <asp:Label ID="Label21" runat="server" CssClass="cur01st" Text="Curso: "></asp:Label>
                                                        <asp:Label ID="dsCursoLabel" runat="server" CssClass="cur01" 
                                                            Text='<%# Eval("dsCurso") %>'></asp:Label>
                                                        <br />
                                                        <asp:Label ID="Label22" runat="server" CssClass="cur01st" Text="Observações:"></asp:Label>
                                                        <br />
                                                        <asp:Label ID="obsLabel" runat="server" CssClass="cur01" 
                                                            Text='<%# Eval("obs") %>'></asp:Label>
                                                        <br />
                                                <br />
                                                        <asp:Label ID="Label23" runat="server" CssClass="cur01st" Text="Início: "></asp:Label>
                                                        <asp:Label ID="data_iniLabel" runat="server" CssClass="cur01" 
                                                            Text='<%# Eval("data_ini", "{0:d}") %>'></asp:Label>
                                                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                                        <asp:Label ID="Label24" runat="server" CssClass="cur01st" Text="Término: "></asp:Label>
                                                        <asp:Label ID="data_fimLabel" runat="server" CssClass="cur01" 
                                                            Text='<%# Eval("data_fim", "{0:d}") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderTemplate>
                                                <br />
                                                <br />
                                                        <asp:Image ID="Image5" runat="server" 
                                                            ImageUrl="~/images/candidato/cv/titformacao.gif" />
                                                    </HeaderTemplate>
                                                    <SeparatorTemplate>
                                                        <asp:Image ID="Image4" runat="server" 
                                                            ImageUrl="~/images/candidato/cv/separador.gif" />
                                                    </SeparatorTemplate>
                                                </asp:DataList>
                                                <asp:DataList ID="DataList5" runat="server" DataSourceID="SqlDataSource5">
                                                    <ItemTemplate>
                                                        <asp:Label ID="InstituicaoLabel" runat="server" CssClass="cur01" 
                                                            Text='<%# Eval("Instituicao") %>'></asp:Label>
                                                        <asp:Label ID="idcurriculoLabel4" runat="server" 
                                                            Text='<%# Eval("idcurriculo") %>' Visible="False"></asp:Label>
                                                        <br />
                                                        <asp:Label ID="Label26" runat="server" CssClass="cur01st" Text="Curso:"></asp:Label>
                                                        <br />
                                                        <asp:Label ID="dsCursoLabel0" runat="server" CssClass="cur01" 
                                                            Text='<%# Eval("dsCurso") %>'></asp:Label>
                                                        <br />
                                                        <asp:Label ID="Label27" runat="server" CssClass="cur01st" Text="Observações:"></asp:Label>
                                                        <br />
                                                        <asp:Label ID="obsCursoLabel" runat="server" CssClass="cur01" 
                                                            Text='<%# Eval("obsCurso") %>'></asp:Label>
                                                        <br />
                                                        <asp:Label ID="Label28" runat="server" CssClass="cur01st" Text="Início: "></asp:Label>
                                                        <asp:Label ID="data_iniLabel0" runat="server" CssClass="cur01" 
                                                            Text='<%# Eval("data_ini", "{0:d}") %>'></asp:Label>
                                                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
                                                        <asp:Label ID="Label29" runat="server" CssClass="cur01st" Text="Término: "></asp:Label>
                                                        <asp:Label ID="data_fimLabel0" runat="server" CssClass="cur01" 
                                                            Text='<%# Eval("data_fim", "{0:d}") %>'></asp:Label>
                                                        <br />
                                                <br />
                                                        <asp:Label ID="Label30" runat="server" CssClass="cur01st" Text="Concluído: "></asp:Label>
                                                        <asp:Label ID="concluidoLabel" runat="server" CssClass="cur01" 
                                                            Text='<%# Eval("concluido") %>'></asp:Label>
                                                        <asp:Label ID="labelRES" runat="server" Text='<%# Eval("concluido") %>' 
                                                            Visible="False"></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderTemplate>
                                                <br />
                                                <br />
                                                        <asp:Image ID="Image6" runat="server" 
                                                            ImageUrl="~/images/candidato/cv/titcursocomplementar.gif" />
                                                    </HeaderTemplate>
                                                    <SeparatorTemplate>
                                                        <asp:Image ID="Image7" runat="server" 
                                                            ImageUrl="~/images/candidato/cv/separador.gif" />
                                                    </SeparatorTemplate>
                                                </asp:DataList>
                                                <asp:DataList ID="DataList6" runat="server" DataSourceID="SqlDataSource6" 
                                                    Width="440px">
                                                    <ItemTemplate>
                                                        <asp:Label ID="dsTipoConhecimentoLabel" runat="server" CssClass="cur01" 
                                                            Text='<%# Eval("dsTipoConhecimento") %>'></asp:Label>
                                                        <asp:Label ID="idcurriculoLabel2" runat="server" 
                                                            Text='<%# Eval("idcurriculo") %>' Visible="False"></asp:Label>
                                                <br />
                                                        <asp:Label ID="dsTipoConhecimentoRelLabel" runat="server" CssClass="cur01" 
                                                            Text='<%# Eval("dsTipoConhecimentoRel") %>'></asp:Label>
                                                <br />
                                                <br />
                                                        <asp:Label ID="dsGrauExperienciaLabel" runat="server" CssClass="cur01" 
                                                            Text='<%# Eval("dsGrauExperiencia") %>'></asp:Label>
                                                        <br />
                                                <br />
                                                        <asp:Label ID="Label32" runat="server" CssClass="cur01st" Text="Observações:"></asp:Label>
                                                        <br />
                                                        <asp:Label ID="obsLabel0" runat="server" CssClass="cur01" 
                                                            Text='<%# Eval("obs") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderTemplate>
                                                <br />
                                                <br />
                                                        <asp:Image ID="Image8" runat="server" 
                                                            ImageUrl="~/images/candidato/cv/titconhecimentoinfo.gif" />
                                                    </HeaderTemplate>
                                                    <SeparatorTemplate>
                                                        <asp:Image ID="Image9" runat="server" 
                                                            ImageUrl="~/images/candidato/cv/separador.gif" />
                                                    </SeparatorTemplate>
                                                </asp:DataList>
                                                <asp:DataList ID="DataList7" runat="server" DataSourceID="SqlDataSource7" 
                                                    Width="440px">
                                                    <ItemTemplate>
                                                        <asp:Label ID="nomeempresaLabel" runat="server" CssClass="cur01" 
                                                            Text='<%# Eval("nomeempresa") %>'></asp:Label>
                                                        <asp:Label ID="idcurriculoLabel3" runat="server" 
                                                            Text='<%# Eval("idcurriculo") %>' Visible="False"></asp:Label>
                                                        <br />
                                                <br />
                                                        <asp:Label ID="Label38" runat="server" CssClass="cur01st" Text="Experiência: "></asp:Label>
                                                        <br />
                                                        <asp:Label ID="dsexperienciaLabel" runat="server" CssClass="cur01" 
                                                            Text='<%# Eval("dsexperiencia") %>'></asp:Label>
                                                        <br />
                                                <br />
                                                        <asp:Label ID="Label33" runat="server" CssClass="cur01st" Text="Início: "></asp:Label>
                                                        <asp:Label ID="data_iniLabel1" runat="server" CssClass="cur01" 
                                                            Text='<%# Eval("data_ini", "{0:d}") %>'></asp:Label>
                                                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                                        <asp:Label ID="Label34" runat="server" CssClass="cur01st" Text="Término:  "></asp:Label>
                                                        <asp:Label ID="data_fimLabel1" runat="server" CssClass="cur01" 
                                                            Text='<%# Eval("data_fim", "{0:d}") %>'></asp:Label>
                                                <br />
                                                <br />
                                                        <asp:Label ID="Label35" runat="server" CssClass="cur01st" 
                                                            Text="Área de Atuacao:"></asp:Label>
                                                        <br />
                                                        <asp:Label ID="dsAreaAtuacaoLabel" runat="server" CssClass="cur01" 
                                                            Text='<%# Eval("dsAreaAtuacao") %>'></asp:Label>
                                                        <br />
                                                <br />
                                                        <asp:Label ID="Label36" runat="server" CssClass="cur01st" 
                                                            Text="Relação trabalhista: "></asp:Label>
                                                        <asp:Label ID="dsRelacaoTrabalhistaLabel" runat="server" CssClass="cur01" 
                                                            Text='<%# Eval("dsRelacaoTrabalhista") %>'></asp:Label>
                                                        <br />
                                                        <asp:Label ID="Label37" runat="server" CssClass="cur01st" 
                                                            Text="Porte da empresa: "></asp:Label>
                                                        <asp:Label ID="dsPorteLabel" runat="server" CssClass="cur01" 
                                                            Text='<%# Eval("dsPorte") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderTemplate>
                                                <br />
                                                <br />
                                                        <asp:Image ID="Image10" runat="server" 
                                                            ImageUrl="~/images/candidato/cv/titconhecimentoprof.gif" />
                                                    </HeaderTemplate>
                                                    <SeparatorTemplate>
                                                        <asp:Image ID="Image13" runat="server" 
                                                            ImageUrl="~/images/candidato/cv/separador.gif" />
                                                    </SeparatorTemplate>
                                                </asp:DataList>
                                                <asp:DataList ID="DataList8" runat="server" DataSourceID="SqlDataSource8">
                                                    <ItemTemplate>
                                                        <asp:Label ID="dsidiomaLabel" runat="server" CssClass="cur01" 
                                                            Text='<%# Eval("dsidioma") %>'></asp:Label>
                                                        <br />
                                                        <asp:Label ID="dsnivelLabel" runat="server" CssClass="cur01" 
                                                            Text='<%# Eval("dsnivel") %>'></asp:Label>
                                                        <br />
                                                <br />
                                                        <asp:Label ID="Label40" runat="server" CssClass="cur01st" Text="Comentários: "></asp:Label>
                                                        <br />
                                                        <asp:Label ID="dscomentarioLabel" runat="server" CssClass="cur01" 
                                                            Text='<%# Eval("dscomentario") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderTemplate>
                                                <br />
                                                <br />
                                                        <asp:Image ID="Image11" runat="server" 
                                                            ImageUrl="~/images/candidato/cv/titidioma.gif" />
                                                    </HeaderTemplate>
                                                    <SeparatorTemplate>
                                                        <asp:Image ID="Image14" runat="server" 
                                                            ImageUrl="~/images/candidato/cv/separador.gif" />
                                                    </SeparatorTemplate>
                                                </asp:DataList>
                                                <asp:DataList ID="DataList9" runat="server" DataSourceID="SqlDataSource9">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label39" runat="server" CssClass="cur01st" Text="Pais: "></asp:Label>
                                                        <asp:Label ID="paisLabel0" runat="server" CssClass="cur01" 
                                                            Text='<%# Eval("pais") %>'></asp:Label>
                                                        <br />
                                                        <asp:Label ID="Label45" runat="server" CssClass="cur01st" Text="Comentários: "></asp:Label>
                                                        <br />
                                                        <asp:Label ID="dsIntercambioLabel" runat="server" CssClass="cur01" 
                                                            Text='<%# Eval("dsIntercambio") %>'></asp:Label>
                                                        <br />
                                                <br />
                                                        <asp:Label ID="Label46" runat="server" CssClass="cur01st" Text="Início: "></asp:Label>
                                                        <asp:Label ID="data_iniLabel2" runat="server" CssClass="cur01" 
                                                            Text='<%# Eval("data_ini", "{0:d}") %>'></asp:Label>
                                                        &nbsp; &nbsp;&nbsp;
                                                        <asp:Label ID="Label47" runat="server" CssClass="cur01st" Text="Término:  "></asp:Label>
                                                        <asp:Label ID="data_fimLabel2" runat="server" CssClass="cur01" 
                                                            Text='<%# Eval("data_fim", "{0:d}") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderTemplate>
                                                <br />
                                                <br />
                                                        <asp:Image ID="Image15" runat="server" 
                                                            ImageUrl="~/images/candidato/cv/titintercambio.gif" />
                                                    </HeaderTemplate>
                                                    <SeparatorTemplate>
                                                        <asp:Image ID="Image16" runat="server" 
                                                            ImageUrl="~/images/candidato/cv/separador.gif" />
                                                    </SeparatorTemplate>
                                                </asp:DataList>
                                                <asp:DataList ID="DataListDef" runat="server" DataKeyField="Obs" 
                                                    DataSourceID="SqlDataSource2">
                                                    <ItemTemplate>
                                                        <asp:Label ID="dsDefFalaLabel" runat="server" CssClass="cur01" 
                                                            Text='<%# Eval("dsDefFala") %>'></asp:Label>
                                                <br />
                                                        <asp:Label ID="dsDefAuditivaLabel" runat="server" CssClass="cur01" 
                                                            Text='<%# Eval("dsDefAuditiva") %>'></asp:Label>
                                                <br />
                                                        <asp:Label ID="dsDefMentalLabel" runat="server" CssClass="cur01" 
                                                            Text='<%# Eval("dsDefMental") %>'></asp:Label>
                                                <br />
                                                        <asp:Label ID="dsDefMotoraLabel" runat="server" CssClass="cur01" 
                                                            Text='<%# Eval("dsDefMotora") %>'></asp:Label>
                                                <br />
                                                        <asp:Label ID="dsDefVisualLabel" runat="server" CssClass="cur01" 
                                                            Text='<%# Eval("dsDefVisual") %>'></asp:Label>
                                                <br />
                                                <br />
                                                        <asp:Label ID="ObsLabel1" runat="server" CssClass="cur01" 
                                                            Text='<%# Eval("Obs") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderTemplate>
                                                <br />
                                                        <asp:Image ID="ImageDef0" runat="server" 
                                                            ImageUrl="~/images/candidato/cv/titdeficiencia.gif" />
                                                    </HeaderTemplate>
                                                </asp:DataList>
                                                <asp:Label ID="Label25" runat="server" Visible="False"></asp:Label>
                                                <asp:Label ID="Label31" runat="server" Visible="False"></asp:Label>
                                                <asp:Label ID="Label41" runat="server" Visible="False"></asp:Label>
                                                <asp:Label ID="Label42" runat="server" Visible="False"></asp:Label>
                                                <asp:Label ID="Label43" runat="server" Visible="False"></asp:Label>
                                                <asp:Label ID="Label44" runat="server" Visible="False"></asp:Label>
                                                <asp:Label ID="LabelDp" runat="server" Visible="False"></asp:Label>
                                                <asp:Label ID="LabelDf" runat="server" Visible="False"></asp:Label>
                                                <asp:Label ID="imageLabel" runat="server" Visible="False"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <asp:Panel ID="PanelAgenda" runat="server" BackColor="White" 
                CssClass="AGPositionPS" Visible="False" ClientIDMode="AutoID">
                <table ID="FormAgenda" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td valign="top" width="210px" align="center">
                            &nbsp;</td>
                        <td valign="top" align="right">
                            <asp:ImageButton ID="ImageButtonFechaAgenda" runat="server" 
                                CausesValidation="False" ImageUrl="~/images/close.png" />
                        </td>
                    </tr>
                    <tr>
                        <td valign="top" width="230px" align="center">
                            <asp:Calendar ID="CalendarCandidato" runat="server" BackColor="Transparent" 
                                BorderStyle="None" CellSpacing="2" FirstDayOfWeek="Sunday" 
                                Font-Overline="False" ForeColor="Black" Height="136px" 
                                NextPrevFormat="FullMonth" TitleFormat="Month" Width="200px">
                                <SelectedDayStyle BackColor="DarkSlateGray" ForeColor="White" />
                                <TodayDayStyle BackColor="#C0C0C0" />
                                <OtherMonthDayStyle BackColor="Transparent" BorderColor="WhiteSmoke" 
                                    ForeColor="DarkGray" />
                                <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" 
                                    VerticalAlign="Bottom" />
                                <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                                <TitleStyle BackColor="Transparent" BorderWidth="0px" Font-Bold="True" 
                                    Font-Size="10pt" ForeColor="Black" />
                            </asp:Calendar>
                            <br />
                            <asp:Label ID="DataAgendamentoLabel" runat="server" Font-Bold="True" 
                                Font-Italic="True"></asp:Label>
                            <br />
                            <asp:FormView ID="FormViewCalendario" runat="server" 
                                DataKeyNames="idCalendario" DataSourceID="SqlDataAgendaForm" 
                                DefaultMode="Insert" Width="100%">
                                <EditItemTemplate>
                                    DataStartField:
                                    <asp:Label ID="DataStartFieldLabel" runat="server" 
                                        Text='<%# Bind("DataStartField") %>' />
                                    <br />
                                    DataEndField:
                                    <asp:Label ID="DataEndFieldLabel" runat="server" 
                                        Text='<%# Bind("DataEndField") %>' />
                                    <br />
                                    DataTextField:
                                    <asp:Label ID="DataTextFieldLabel" runat="server" 
                                        Text='<%# Bind("DataTextField") %>' />
                                    <br />
                                    DataValueField:
                                    <asp:Label ID="DataValueFieldLabel" runat="server" 
                                        Text='<%# Bind("DataValueField") %>' />
                                    <br />
                                    Evento:
                                    <asp:Label ID="EventoLabel" runat="server" Text='<%# Bind("Evento") %>' />
                                    <br />
                                    dsEventoAceite:
                                    <asp:Label ID="dsEventoAceiteLabel" runat="server" 
                                        Text='<%# Bind("dsEventoAceite") %>' />
                                </EditItemTemplate>
                                <EmptyDataTemplate>
                                    <asp:LinkButton ID="LinkButton2" runat="server" CommandName="New" 
                                        onload="LinkButton2_Load"></asp:LinkButton>
                                </EmptyDataTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="idCadastroEmpresaTextBox" runat="server" 
                                        Text='<%# Bind("idCadastroEmpresa") %>' Visible="False" Width="1px" />
                                    <asp:TextBox ID="idRH_GestorTextBox" runat="server" 
                                        Text='<%# Bind("idRH_Gestor") %>' Visible="False" Width="1px" />
                                    <asp:TextBox ID="idUserTextBox" runat="server" Text='<%# Bind("idUser") %>' 
                                        Visible="False" Width="1px" />
                                    <asp:TextBox ID="idCurriculoTextBox" runat="server" 
                                        Text='<%# Bind("idCurriculo") %>' Visible="False" Width="1px" />
                                    <asp:TextBox ID="idEventoAgendaTextBox" runat="server" 
                                        Text='<%# Bind("idEventoAgenda") %>' Visible="False" Width="1px" />
                                    <asp:TextBox ID="idProcessoSeletivoTextBox" runat="server" 
                                        Text='<%# Bind("idProcessoSeletivo") %>' Visible="False" Width="1px" />
                                    <asp:TextBox ID="idFaseProcessoSeletivoCVTextBox" runat="server" 
                                        Text='<%# Bind("idFaseProcessoSeletivoCV") %>' Visible="False" Width="1px" />
                                    <asp:TextBox ID="DataStartFieldTextBox" runat="server" 
                                        Text='<%# Bind("DataStartField") %>' Visible="False" Width="1px" />
                                    <asp:TextBox ID="DataEndFieldTextBox" runat="server" 
                                        Text='<%# Bind("DataEndField") %>' Visible="False" Width="1px" />
                                    <asp:TextBox ID="EventoTextBox" runat="server" Text='<%# Bind("Evento") %>' 
                                        Visible="False" Width="1px" />
                                    <asp:TextBox ID="dsEventoAceiteTextBox" runat="server" 
                                        Text='<%# Bind("dsEventoAceite") %>' Visible="False" Width="1px" />
                                    <asp:TextBox ID="DataValueFieldTextBox" runat="server" 
                                        Text='<%# Bind("DataValueField") %>' Visible="False" Width="1px" />
                                    <asp:TextBox ID="aceitoTextBox" runat="server" Text='<%# Bind("aceito") %>' 
                                        Visible="False" Width="1px"></asp:TextBox>
                                    <asp:Label ID="msn" runat="server" CssClass="msn"></asp:Label>
                                    <table cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td>
                                                <asp:Label ID="LabelHoraIni" runat="server" Text="Hora início:"></asp:Label>
                                                <br />
                                                <asp:DropDownList ID="DropDownListIni" runat="server" AutoPostBack="True" 
                                                    CssClass="DropCad" DataSourceID="SqlHoraIni" DataTextField="data_start" 
                                                    DataValueField="data_start" 
                                                    onselectedindexchanged="DropDownListIni_SelectedIndexChanged" 
                                                    ValidationGroup="AGENDA" Width="130px">
                                                </asp:DropDownList>
                                            </td>
                                            <td>
                                                <asp:Label ID="LabelHoraFim" runat="server" Text="Hora encerramento:"></asp:Label>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                                    ControlToValidate="DropDownListFim" 
                                                    ErrorMessage="O horário de encerramento do agendamento é obrigatório." 
                                                    ValidationGroup="AGENDA">*</asp:RequiredFieldValidator>
                                                <br />
                                                <asp:DropDownList ID="DropDownListFim" runat="server" CssClass="DropCad" 
                                                    DataSourceID="SqlHoraFim" DataTextField="data_end" DataValueField="data_end" 
                                                    ValidationGroup="AGENDA" Width="130px">
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                    </table>
                                    <br />
                                    <asp:Label ID="LabelAgendamento" runat="server" Text="Recado ao Candidato:"></asp:Label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                        ControlToValidate="DataTextFieldTextBox" 
                                        ErrorMessage="Informe algo sobre o agendamento." ValidationGroup="AGENDA">*</asp:RequiredFieldValidator>
                                    <br />
                                    <asp:TextBox ID="DataTextFieldTextBox" runat="server" CssClass="InputCad" 
                                        Height="100px" TextMode="MultiLine" 
                                        ValidationGroup="AGENDA" Width="255px" />
                                    <br />
                                    <br />
                                    <asp:ValidationSummary ID="ValidationSummary2" runat="server" 
                                        ShowMessageBox="True" ShowSummary="False" ValidationGroup="AGENDA" />
                                    <asp:ImageButton ID="ImageButtonAgendar" runat="server" CommandName="Insert" 
                                        ImageUrl="~/images/empresa/PS_Agendar_BT.png" ValidationGroup="AGENDA" />
                                    <asp:ImageButton ID="ImageButtonCancel" runat="server" CausesValidation="False" 
                                        CommandName="Cancel" ImageUrl="~/images/empresa/btCancelarAction.png" 
                                        onclick="ImageButtonCancel_Click" />
                                    <br />
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    idCalendario:
                                    <asp:Label ID="idCalendarioLabel" runat="server" 
                                        Text='<%# Eval("idCalendario") %>' />
                                    <br />
                                    idCadastroEmpresa:
                                    <asp:Label ID="idCadastroEmpresaLabel" runat="server" 
                                        Text='<%# Bind("idCadastroEmpresa") %>' />
                                    <br />
                                    idRH_Gestor:
                                    <asp:Label ID="idRH_GestorLabel" runat="server" 
                                        Text='<%# Bind("idRH_Gestor") %>' />
                                    <br />
                                    idUser:
                                    <asp:Label ID="idUserLabel" runat="server" Text='<%# Bind("idUser") %>' />
                                    <br />
                                    idCurriculo:
                                    <asp:Label ID="idCurriculoLabel" runat="server" 
                                        Text='<%# Bind("idCurriculo") %>'></asp:Label>
                                    <br />
                                    idEventoAgenda:
                                    <asp:Label ID="idEventoAgendaLabel" runat="server" 
                                        Text='<%# Bind("idEventoAgenda") %>' />
                                    <br />
                                    idProcessoSeletivo:
                                    <asp:Label ID="idProcessoSeletivoLabel" runat="server" 
                                        Text='<%# Bind("idProcessoSeletivo") %>' />
                                    <br />
                                    idFaseProcessoSeletivoCV:
                                    <asp:Label ID="idFaseProcessoSeletivoCVLabel" runat="server" 
                                        Text='<%# Bind("idFaseProcessoSeletivoCV") %>' />
                                    <br />
                                    DataStartField:
                                    <asp:Label ID="DataStartFieldLabel" runat="server" 
                                        Text='<%# Bind("DataStartField") %>' />
                                    <br />
                                    DataEndField:
                                    <asp:Label ID="DataEndFieldLabel" runat="server" 
                                        Text='<%# Bind("DataEndField") %>' />
                                    <br />
                                    DataTextField:
                                    <asp:Label ID="DataTextFieldLabel" runat="server" 
                                        Text='<%# Bind("DataTextField") %>' />
                                    <br />
                                    DataValueField:
                                    <asp:Label ID="DataValueFieldLabel" runat="server" 
                                        Text='<%# Bind("DataValueField") %>' />
                                    <br />
                                    Evento:
                                    <asp:Label ID="EventoLabel" runat="server" Text='<%# Bind("Evento") %>' />
                                    <br />
                                    dsEventoAceite:
                                    <asp:Label ID="dsEventoAceiteLabel" runat="server" 
                                        Text='<%# Bind("dsEventoAceite") %>' />
                                    <br />
                                    aceito:
                                    <asp:Label ID="aceitoLabel" runat="server" Text='<%# Bind("aceito") %>' />
                                    <br />
                                    <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                                        CommandName="Edit" Text="Edit" />
                                    &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                                        CommandName="Delete" Text="Delete" />
                                    &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                                        CommandName="New" Text="New" />
                                </ItemTemplate>
                            </asp:FormView>
                        </td>
                        <td valign="top" align="center">
                            <DayPilot:DayPilotCalendar ID="DayPilotCalendarCandidato" runat="server" 
                                BackColor="#FFFFD5" BorderColor="#AAAAAA" BusinessBeginsHour="8" 
                                DataEndField="DataEndField" DataSourceID="SqlDataAgenda" 
                                DataStartField="DataStartField" DataTextField="DataTextField" 
                                DataValueField="idCalendario" DayFontFamily="Tahoma" DayFontSize="10pt" 
                                DurationBarColor="#FF9900" EventBackColor="#FFFFFF" EventBorderColor="#000000" 
                                EventClickHandling="PostBack" 
                                EventClickJavaScript="UserActionHandling.JavaScript" EventFontFamily="Tahoma" 
                                EventFontSize="8pt" EventHoverColor="#DCDCDC" FreetimeClickHandling="PostBack" 
                                FreeTimeClickJavaScript="UserActionHandling.JavaScript" 
                                HourBorderColor="#EAD098" HourFontFamily="Tahoma" HourFontSize="16pt" 
                                HourHalfBorderColor="#F3E4B1" HourNameBackColor="#ECE9D8" 
                                HourNameBorderColor="#ACA899" HoverColor="#FFED95" 
                                NonBusinessBackColor="#FFF4BC" StartDate="2011-07-11" Width="300px" 
                                ShowToolTip="False" />
                            <br />
                        </td>
                    </tr>
                </table>
            </asp:Panel>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                
                
                SelectCommand="SELECT tbCadastroUser.idCadastroUser, tbCadastroUser.nome, tbCadastroUser.endereco, tbCadastroUser.cep, tbCadastroUser.bairro, tbCadastroUser.cidade, tbCadastroUser.uf, tbCadastroUser.pais, tbCadastroUser.nascimento, tbCadastroUser.sexo, tbCadastroUser.cadastroTipo, tbCadastroUser.apresentar, tbCadastroUser.estadocivil, tbCadastroUser.nrdependente, tbCadastroUser.portadorDef, tbCadastroUser.trabalhando, tbCadastroUser.resumo, tbCadastroUser.valorRemAtual, tbCadastroUser.valorRemPretendida, tbCadastroUser.localPreferencia, tbCadastroUser.disponibilidade, tbCadastroUser.origem, tbCadastroUser.data, tbCadastroUser.foto, tbuser.email FROM tbCadastroUser INNER JOIN tbuser ON tbCadastroUser.idUser = tbuser.idUser WHERE (tbCadastroUser.idUser = @idUser)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="idUserLabel" DefaultValue="0" Name="idUser" 
                        PropertyName="Text" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                SelectCommand="SELECT [idUser], [dsDefFala], [dsDefAuditiva], [dsDefMental], [dsDefMotora], [dsDefVisual], [Obs] FROM [vwdeficienciafisica] WHERE ([idUser] = @idUser)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="idUserLabel" DefaultValue="0" Name="idUser" 
                        PropertyName="Text" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                SelectCommand="SELECT [idcurriculo], [apresentacao], [realizacao], [resumogeral], [objetivo] FROM [tbCartaApresentacao] WHERE ([idcurriculo] = @idcurriculo)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="idcurriculoLabel" DefaultValue="" 
                        Name="idcurriculo" PropertyName="Text" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                SelectCommand="SELECT [idcurriculo], [dsCurso], [obs], [data_ini], [data_fim], [dsinstituicao], [estado], [uf], [dsTipo] FROM [vwformacaoacademica] WHERE ([idcurriculo] = @idcurriculo)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="idcurriculoLabel" DefaultValue="0" 
                        Name="idcurriculo" PropertyName="Text" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
                ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                SelectCommand="SELECT [idcurriculo], [Instituicao], [dsCurso], [obsCurso], [data_ini], [data_fim], [concluido] FROM [tbCursoExtraCurricular] WHERE ([idcurriculo] = @idcurriculo)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="idcurriculoLabel" DefaultValue="0" 
                        Name="idcurriculo" PropertyName="Text" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource6" runat="server" 
                ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                SelectCommand="SELECT [idcurriculo], [dsTipoConhecimento], [dsGrauExperiencia], [dsTipoConhecimentoRel], [obs] FROM [vwconhecimentoInfo] WHERE ([idcurriculo] = @idcurriculo)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="idcurriculoLabel" DefaultValue="0" 
                        Name="idcurriculo" PropertyName="Text" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource7" runat="server" 
                ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                SelectCommand="SELECT [nomeempresa], [dsexperiencia], [data_ini], [data_fim], [dsAreaAtuacao], [dsRelacaoTrabalhista], [dsPorte], [idcurriculo] FROM [vwExperienciaProf] WHERE ([idcurriculo] = @idcurriculo) ORDER BY [data_ini] DESC, [data_fim] DESC">
                <SelectParameters>
                    <asp:ControlParameter ControlID="idcurriculoLabel" DefaultValue="0" 
                        Name="idcurriculo" PropertyName="Text" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource8" runat="server" 
                ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                SelectCommand="SELECT [idcurriculo], [dsnivel], [dsidioma], [dscomentario] FROM [vwidioma] WHERE ([idcurriculo] = @idcurriculo)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="idcurriculoLabel" DefaultValue="" 
                        Name="idcurriculo" PropertyName="Text" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource9" runat="server" 
                ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                SelectCommand="SELECT [idcurriculo], [pais], [dsIntercambio], [data_ini], [data_fim] FROM [tbintercambio] WHERE ([idcurriculo] = @idcurriculo) ORDER BY [data_ini] DESC, [data_fim] DESC">
                <SelectParameters>
                    <asp:ControlParameter ControlID="idcurriculoLabel" DefaultValue="0" 
                        Name="idcurriculo" PropertyName="Text" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </asp:Panel>

                <br />
                                <br />
                                <asp:SqlDataSource ID="SqlFaseExe" runat="server" 
            ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
            SelectCommand="_USP_PROCESSOSELETIVO_FASES_EXECUTANDO" 
            SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="idCadastroEmpresa" SessionField="idCadastroEmpresa" 
                                            Type="Int32" />
                                        <asp:SessionParameter Name="idCadastroEmpresa_Filha" 
                                            SessionField="IdCadastroEmpresaFilha" Type="Int32" />
                                        <asp:ControlParameter ControlID="idVagaLabel" Name="idVaga" PropertyName="Text" 
                                            Type="Int32" />
                                    </SelectParameters>
        </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlVaga" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        
                    
                    SelectCommand="_USP_PROCESSOSELETIVO_DROPDOWNLIST_FASES" 
                    SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="idCadastroEmpresa" SessionField="idCadastroEmpresa" Type="Int32" />
            <asp:ControlParameter ControlID="idCadastroEmpresaFilhaLabel" 
                Name="idCadastroEmpresa_Filha" PropertyName="Text" Type="Int32" />
            <asp:SessionParameter Name="idRH_Gestor" SessionField="idRH_Gestor" 
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlEmpresa" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        
        SelectCommand="SELECT idCadastroEmpresa, nmempresa, idCadastroEmpresa_Pai FROM tbCadastroEmpresa WHERE (idCadastroEmpresa_Pai = @idCadastroEmpresa_Pai) OR (idCadastroEmpresa = @idCadastroEmpresa)">
        <SelectParameters>
            <asp:SessionParameter Name="idCadastroEmpresa_Pai" 
                SessionField="idCadastroEmpresa" Type="Int32" />
            <asp:SessionParameter Name="idCadastroEmpresa" 
                SessionField="idCadastroEmpresaFilha" />
        </SelectParameters>
    </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlAndamentoFase" runat="server" 
            ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
            SelectCommand="SELECT [idFaseProcessoSeletivoCV], [idFaseProcessoSeletivo], [idcurriculo], [comentario], [flgAprovado] FROM [tbFaseProcessoSeletivoCV]">
        </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlListaSelecionados" runat="server" 
            ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
            SelectCommand="_USP_PROCESSOSELETIVO_REALTIME_EXE_LISTA_SELECIONADO" 
            SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="idFaseProcessoSeletivoLabel" 
                            Name="idFaseProcessoSeletivo" PropertyName="Text" Type="Int32" />
                        <asp:ControlParameter ControlID="idTipoFaseProcessoSeletivoLabel" 
                            Name="idTipoFaseProcessoSeletivo" PropertyName="Text" Type="Int32" />
                    </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlExpontaneo" runat="server" 
            ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
            SelectCommand="_USP_PROCESSOSELETIVO_CANDIDATOS_EXPONTANEOS" 
            SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="idVagaLabel" Name="idvaga" PropertyName="Text" 
                    Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlIndicacoes" runat="server" 
            ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
            SelectCommand="_USP_CADASTRA_INDICACAO_PROFISSIONAL_LISTA" 
            SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="idCadastroEmpresa" SessionField="idCadastroEmpresa" 
                    Type="Int32" />
                <asp:SessionParameter Name="idCadastroEmpresaFilha" 
                    SessionField="idCadastroEmpresaFilha" Type="Int32" />
                <asp:ControlParameter ControlID="idVagaLabel" Name="idVaga" PropertyName="Text" 
                    Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
                            <asp:SqlDataSource ID="SqlHoraIni" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        SelectCommand="SELECT [idAgendaHoraInicio], [data_start] FROM [tbAgendaHora]">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlHoraFim" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        
            SelectCommand="SELECT idAgendaHoraTermino, data_end FROM tbAgendaHoraTermino WHERE (data_end  &gt; @data_start )">
        <SelectParameters>
            <asp:ControlParameter ControlID="HorainiLabel" Name="data_start" 
                PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
        <br />
                </asp:Content>

