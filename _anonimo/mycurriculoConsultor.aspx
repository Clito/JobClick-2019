<%@ Page Language="VB" MaintainScrollPositionOnPostback="true" MasterPageFile="~/_anonimo/CurriculoPage.master" AutoEventWireup="true" CodeFile="mycurriculoConsultor.aspx.vb" Inherits="_candidato_mycurriculo" title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <table id="AVALIACAO" width="626px">
            <tr>
                <td>
                    <asp:Panel ID="PanelCandidatura" runat="server">
                        <asp:Label ID="Label45" runat="server" CssClass="tituloEmpresa" 
                        Text="Avaliação da Candidatura"></asp:Label>
                        <asp:Label ID="idVagaLabel" runat="server" Visible="False"></asp:Label>
                        <asp:Label ID="idCurriculoFASELabel" runat="server" Visible="False"></asp:Label>
                        <asp:Label ID="idRELcandidato_vagaLabel" runat="server" Visible="False"></asp:Label>
                        <asp:Label ID="nomeCandidatoLabel" runat="server" Visible="False"></asp:Label>
                        <asp:Label ID="emailCandidatoLabel" runat="server" Visible="False"></asp:Label>
                        <asp:Label ID="VagaLabel" runat="server" Visible="False"></asp:Label>
                        <asp:Label ID="protocoloLabel" runat="server" Visible="False"></asp:Label>
                        <br />
                        <br />
                        <asp:Label ID="msnConsultor" runat="server" CssClass="msnOK"></asp:Label>
                        <br />
                        <asp:RadioButtonList ID="liberarCandidato" runat="server">
                            <asp:ListItem Selected="True" Value="1">APROVADO (Entra para as próximas fases do Processo Seletivo)</asp:ListItem>
                            <asp:ListItem Value="0">REPROVADO (Libera o candidato da candidatura)</asp:ListItem>
                        </asp:RadioButtonList>
                        <asp:Label ID="MSN" runat="server" CssClass="msn"></asp:Label>
                        <br />
                        <asp:Label ID="Label46" runat="server" 
                            Text="Escreva a mensagem para o candidato:"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ControlToValidate="comentarioCV" Display="Dynamic" 
                            ErrorMessage="&lt;br&gt;* Escreva uma mensagem para o candidato." 
                            ValidationGroup="CANDIDATURA"></asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="comentarioCV" runat="server" CssClass="InputCad" 
                            Height="120px" TextMode="MultiLine" ValidationGroup="CANDIDATURA" Width="100%"></asp:TextBox>
                        <br />
                        <asp:Label ID="Label49" runat="server" 
                            Text="Seus comentários profissionais sobre o perfil do candidato:"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                            ControlToValidate="comentarioCV0" Display="Dynamic" 
                            ErrorMessage="&lt;br&gt;* Independente da aprovação ou não do candidato escreva suas impressões." 
                            ValidationGroup="CANDIDATURA"></asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="comentarioCV0" runat="server" CssClass="InputCad" 
                            Height="120px" TextMode="MultiLine" ValidationGroup="CANDIDATURA" Width="100%"></asp:TextBox>
                        <br />
                        <br />
                        <asp:Label ID="Label50" runat="server" 
                            Text="Informe em qual fase o candidato [foi] ou [não foi] aprovado."></asp:Label>
                        <asp:GridView ID="GridViewFases" runat="server" AutoGenerateColumns="False" 
                            BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
                            DataKeyNames="idFaseProcessoSeletivo,dsFase,idRELcandidato_vaga,dsfuncao,Protocolo" 
                            DataSourceID="SqlFase" GridLines="Horizontal" Width="100%">
                            <Columns>
                                <asp:BoundField DataField="idFaseProcessoSeletivo" 
                                    HeaderText="idFaseProcessoSeletivo" InsertVisible="False" ReadOnly="True" 
                                    SortExpression="idFaseProcessoSeletivo" Visible="False" />
                                <asp:BoundField DataField="idProcessoSeletivo" HeaderText="idProcessoSeletivo" 
                                    SortExpression="idProcessoSeletivo" Visible="False" />
                                <asp:BoundField DataField="idTipoFaseProcessoSeletivo" 
                                    HeaderText="idTipoFaseProcessoSeletivo" 
                                    SortExpression="idTipoFaseProcessoSeletivo" Visible="False" />
                                <asp:BoundField DataField="dataIni" HeaderText="dataIni" 
                                    SortExpression="dataIni" Visible="False" />
                                <asp:BoundField DataField="dataFim" HeaderText="dataFim" 
                                    SortExpression="dataFim" Visible="False" />
                                <asp:BoundField DataField="mensagemAprovado" HeaderText="mensagemAprovado" 
                                    SortExpression="mensagemAprovado" Visible="False" />
                                <asp:BoundField DataField="mensagemNAprovado" HeaderText="mensagemNAprovado" 
                                    SortExpression="mensagemNAprovado" Visible="False" />
                                <asp:BoundField DataField="iniciado" HeaderText="iniciado" 
                                    SortExpression="iniciado" Visible="False" />
                                <asp:BoundField DataField="encerrado" HeaderText="encerrado" 
                                    SortExpression="encerrado" Visible="False" />
                                <asp:BoundField DataField="dataCriacao" HeaderText="dataCriacao" 
                                    SortExpression="dataCriacao" Visible="False" />
                                <asp:BoundField DataField="idVaga" HeaderText="idVaga" InsertVisible="False" 
                                    ReadOnly="True" SortExpression="idVaga" Visible="False" />
                                <asp:ButtonField CommandName="Select" DataTextField="Protocolo" 
                                    HeaderText="Protocolo" Text="Button">
                                <HeaderStyle HorizontalAlign="Left" />
                                </asp:ButtonField>
                                <asp:BoundField DataField="Protocolo" HeaderText="Protocolo" 
                                    SortExpression="Protocolo" Visible="False">
                                <HeaderStyle HorizontalAlign="Left" />
                                </asp:BoundField>
                                <asp:BoundField DataField="dsfuncao" HeaderText="Vaga" 
                                    SortExpression="dsfuncao">
                                <HeaderStyle HorizontalAlign="Left" />
                                </asp:BoundField>
                                <asp:BoundField DataField="idSetup" HeaderText="idSetup" 
                                    SortExpression="idSetup" Visible="False" />
                                <asp:BoundField DataField="dsFase" HeaderText="Fases do Processo Seletivo" 
                                    SortExpression="dsFase">
                                <HeaderStyle HorizontalAlign="Left" />
                                </asp:BoundField>
                            </Columns>
                        </asp:GridView>
                        <asp:TextBox ID="idFaseTextBox" runat="server" CssClass="InputCad" 
                            ValidationGroup="CANDIDATURA" Width="100%"></asp:TextBox>
                        <br />
                        <asp:Label ID="idFaseLabel" runat="server" Visible="False"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                            ControlToValidate="idFaseTextBox" Display="Dynamic" 
                            ErrorMessage="* Selecione uma fase do processo seletivo." 
                            ValidationGroup="CANDIDATURA"></asp:RequiredFieldValidator>
                        <br />
                        <br />
                        <asp:RadioButtonList ID="pontuacao" runat="server" DataSourceID="SqlPontuacao" 
                            DataTextField="pontuacao" DataValueField="pontuacao" RepeatColumns="11" 
                            RepeatDirection="Horizontal" ValidationGroup="CANDIDATURA" Visible="False">
                        </asp:RadioButtonList>
                        <br />
                        <br />
                        <asp:SqlDataSource ID="SqlPontuacao" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                            ProviderName="System.Data.SqlClient" 
                            SelectCommand="SELECT [pontuacao] FROM [tbPontuacao]"></asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlFase" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                            SelectCommand="_USP_CANDIDATURAS_OURO_FASES_PROCESSO_SELETIVO" 
                            SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="idVagaLabel" Name="idVaga" PropertyName="Text" 
                                    Type="Int32" />
                                <asp:ControlParameter ControlID="idCurriculoFASELabel" Name="idcurriculo" 
                                    PropertyName="Text" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:Button ID="ButtonSalvar" runat="server" 
                            Text="Grava a sua ação e envia e-mail ao candidato" 
                            ValidationGroup="CANDIDATURA" Width="626px" />
                        <br />
                    </asp:Panel>
                    <br />
                    <br />
                    <asp:Label ID="Label48" runat="server" CssClass="tituloEmpresa" 
                        Text="Dados do candidato"></asp:Label>
                    <br />
                    <br />
                </td>
            </tr>
        </table>
        <table width="626px" cellpadding="0" cellspacing="0">
        <tr>
            <td width="26" style="height: 35px"><asp:Image ID="lateralInt" runat="server" ImageUrl="~/images/h26.gif" /></td>
            <td width="600">
            
                <table border="0" width="600" cellpadding="0" cellspacing="0">
                    <tr>
                        <td valign="top" width="135" height="131">
                            <asp:Image ID="ImageCandidato" runat="server" ImageUrl="~/images/cvnoImage.png" 
                                Width="150px" />
                            <br />
                                                <asp:Image ID="ImageDef" runat="server" ImageUrl="~/images/candidato/cv/deficienteT.gif" ImageAlign="Right" Visible="False" ToolTip="Pessoa com necessidades especiais." /></td>
                        <td width="465" valign="top"><asp:Image ID="Image1" runat="server" ImageUrl="~/images/candidato/cv/titdadospessoais.gif" /><br />
                            <table cellpadding="0" cellspacing="0" width="465">
                                <tr>
                                    <td width="26">
                                        <asp:Image ID="lateral" runat="server" ImageUrl="~/images/h26.gif" /></td>
                                    <td width="439">
                                        <asp:DataList ID="DataList1" runat="server" DataKeyField="idCadastroUser" DataSourceID="SqlDataSource1" Width="420px">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" CssClass="cur01st" Text="Nome:"></asp:Label>&nbsp;<br />
                                                <asp:Label ID="nomeLabel" runat="server" Text='<%# Eval("nome") %>' CssClass="cur01"></asp:Label><br />
                                                <asp:Label ID="Label2" runat="server" CssClass="cur01st" Text="Endereço: "></asp:Label>&nbsp;<br />
                                                <asp:Label ID="enderecoLabel" runat="server" Text='<%# Eval("endereco") %>' CssClass="cur01"></asp:Label>&nbsp;<br />
                                                <asp:Label ID="complementoLabel" runat="server" Text='<%# Eval("complemento") %>' CssClass="cur01"></asp:Label>&nbsp;<br />
                                                <asp:Label ID="bairroLabel" runat="server" Text='<%# Eval("bairro") %>' CssClass="cur01"></asp:Label>
                                                -
                                                <asp:Label ID="cidadeLabel" runat="server" Text='<%# Eval("cidade") %>' CssClass="cur01"></asp:Label>
                                                /
                                                <asp:Label ID="ufLabel" runat="server" Text='<%# Eval("uf") %>' CssClass="cur01"></asp:Label>
                                                -
                                                <asp:Label ID="paisLabel" runat="server" Text='<%# Eval("pais") %>' CssClass="cur01"></asp:Label><br />
                                                <asp:Label ID="Label3" runat="server" CssClass="cur01st" Text="CEP: "></asp:Label>
                                                <asp:Label ID="cepLabel" runat="server" Text='<%# Eval("cep") %>' CssClass="cur01"></asp:Label><br />
                                                <br />
                                                <asp:Label ID="Label5" runat="server" CssClass="cur01st" Text="Data de nascimento:"></asp:Label>
                                                <asp:Label ID="nascimentoLabel" runat="server" Text='<%# Eval("nascimento", "{0:d}") %>' CssClass="cur01"></asp:Label>&nbsp;<br />
                                                <asp:Label ID="Label6" runat="server" CssClass="cur01st" Text="Sexo: "></asp:Label><asp:Label ID="sexoLabel" runat="server" Text='<%# Eval("sexo") %>' CssClass="cur01"></asp:Label><br />
                                                <br />
                                                <asp:Label ID="Label7" runat="server" CssClass="cur01st" Text="Cadastrado como: "></asp:Label><asp:Label ID="cadastroTipoLabel" runat="server" Text='<%# Eval("cadastroTipo") %>' CssClass="cur01"></asp:Label><br />
                                                <br />
                                                <asp:Label ID="Label8" runat="server" CssClass="cur01st" Text="Estado civil: "></asp:Label><asp:Label ID="estadocivilLabel" runat="server" Text='<%# Eval("estadocivil") %>' CssClass="cur01"></asp:Label><br />
                                                <asp:Label ID="Label9" runat="server" CssClass="cur01st" Text="Dependente(s): "></asp:Label><asp:Label ID="nrdependenteLabel" runat="server" Text='<%# Eval("nrdependente") %>' CssClass="cur01"></asp:Label><br />
                                                <br />
                                                <asp:Label ID="Label10" runat="server" CssClass="cur01st" Text="Resumo profissional:"></asp:Label><br />
                                                <asp:Label ID="resumoLabel" runat="server" Text='<%# Eval("resumo") %>' CssClass="cur01"></asp:Label><br />
                                                <br />
                                                <asp:Label ID="Label11" runat="server" CssClass="cur01st" Text="Remuneração atual: "></asp:Label><br />
                                                <asp:Label ID="valorRemAtualLabel" runat="server" Text='<%# Eval("valorRemAtual", "{0:C}") %>' CssClass="cur01"></asp:Label><br />
                                                <asp:Label ID="Label12" runat="server" CssClass="cur01st" Text="Remuneração pretendida: "></asp:Label><br />
                                                <asp:Label ID="valorRemPretendidaLabel" runat="server" Text='<%# Eval("valorRemPretendida", "{0:C}") %>' CssClass="cur01"></asp:Label><br />
                                                <br />
                                                <asp:Label ID="Label13" runat="server" CssClass="cur01st" Text="Deseja trabalhar em: "></asp:Label><br />
                                                <asp:Label ID="localPreferenciaLabel" runat="server" Text='<%# Eval("localPreferencia") %>' CssClass="cur01"></asp:Label><br />
                                                <asp:Label ID="Label14" runat="server" CssClass="cur01st" Text="Disponibilidade: "></asp:Label><br />
                                                <asp:Label ID="disponibilidadeLabel" runat="server" Text='<%# Eval("disponibilidade") %>' CssClass="cur01"></asp:Label><br />
                                                <br />
                                                <asp:Label ID="Label15" runat="server" CssClass="cur01st" Text="Origem: "></asp:Label><asp:Label ID="origemLabel" runat="server" Text='<%# Eval("origem") %>' CssClass="cur01"></asp:Label><br />
                                                <asp:Label ID="Label16" runat="server" CssClass="cur01st" Text="Data do cadastro: "></asp:Label><asp:Label ID="dataLabel" runat="server" Text='<%# Eval("data") %>' CssClass="cur01"></asp:Label>
                                                <asp:Label ID="portadorDefLabel" runat="server" Text='<%# Eval("portadorDef") %>' Visible="False"></asp:Label>
                                                <asp:Label ID="trabalhandoLabel" runat="server" Text='<%# Eval("trabalhando") %>' Visible="False">
                                                </asp:Label><br />
                                            </ItemTemplate>
                                        </asp:DataList><asp:DataList ID="DataList2" runat="server" DataSourceID="SqlDataSource2">
                                            <ItemTemplate>
                                                <br />
                                                <br />
                                                <asp:Image ID="Image2" runat="server" ImageUrl="~/images/candidato/cv/titdeficiencia.gif" /><br />
                                                <asp:Label ID="dsDefFalaLabel" runat="server" CssClass="cur01" Text='<%# Eval("dsDefFala") %>'></asp:Label><br />
                                                <asp:Label ID="dsDefAuditivaLabel" runat="server" CssClass="cur01" Text='<%# Eval("dsDefAuditiva") %>'></asp:Label><br />
                                                <asp:Label ID="dsDefMentalLabel" runat="server" CssClass="cur01" Text='<%# Eval("dsDefMental") %>'></asp:Label><br />
                                                <asp:Label ID="dsDefMotoraLabel" runat="server" CssClass="cur01" Text='<%# Eval("dsDefMotora") %>'></asp:Label><br />
                                                <asp:Label ID="dsDefVisualLabel" runat="server" CssClass="cur01" Text='<%# Eval("dsDefVisual") %>'></asp:Label><br />
                                                <asp:Label ID="Label4" runat="server" CssClass="cur01st" Text="Observações feitas pelo candidato:"></asp:Label><br />
                                                <asp:Label ID="ObsLabel" runat="server" CssClass="cur01" Text='<%# Eval("Obs") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:DataList><asp:DataList ID="DataList3" runat="server" DataSourceID="SqlDataSource3">
                                            <ItemTemplate>
                                                <br />
                                                <br />
                                                <asp:Image ID="Image3" runat="server" ImageUrl="~/images/candidato/cv/titobjetivo.gif" /><br />
                                                <asp:Label ID="Label17" runat="server" CssClass="cur01st" Text="Apresentacao:"></asp:Label><br />
                                                <asp:Label ID="apresentacaoLabel" runat="server" CssClass="cur01" Text='<%# Eval("apresentacao") %>'></asp:Label><br />
                                                <br />
                                                <asp:Label ID="Label18" runat="server" CssClass="cur01st" Text="Realizações:"></asp:Label><br />
                                                <asp:Label ID="realizacaoLabel" runat="server" CssClass="cur01" Text='<%# Eval("realizacao") %>'></asp:Label><br />
                                                <br />
                                                <asp:Label ID="Label19" runat="server" CssClass="cur01st" Text="Resumo:"></asp:Label><br />
                                                <asp:Label ID="resumogeralLabel" runat="server" CssClass="cur01" Text='<%# Eval("resumogeral") %>'></asp:Label><br />
                                                <br />
                                                <asp:Label ID="Label20" runat="server" CssClass="cur01st" Text="Objetivo:"></asp:Label><br />
                                                <asp:Label ID="objetivoLabel" runat="server" CssClass="cur01" Text='<%# Eval("objetivo") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:DataList><asp:DataList ID="DataList4" runat="server" DataKeyField="estado" DataSourceID="SqlDataSource4"
                                            ShowFooter="False">
                                            <ItemTemplate>
                                                <asp:Label ID="dsinstituicaoLabel" runat="server" CssClass="cur01" Text='<%# Eval("dsinstituicao") %>'></asp:Label>
                                                <asp:Label ID="idcurriculoLabel" runat="server" Text='<%# Eval("idcurriculo") %>'
                                                    Visible="False"></asp:Label><br />
                                                <asp:Label ID="estadoLabel" runat="server" CssClass="cur01" Text='<%# Eval("estado") %>'></asp:Label>
                                                /
                                                <asp:Label ID="ufLabel" runat="server" CssClass="cur01" Text='<%# Eval("uf") %>'></asp:Label><br />
                                                <br />
                                                <asp:Label ID="Label21" runat="server" CssClass="cur01st" Text="Curso: "></asp:Label><asp:Label
                                                    ID="dsCursoLabel" runat="server" CssClass="cur01" Text='<%# Eval("dsCurso") %>'></asp:Label><br />
                                                <asp:Label ID="Label22" runat="server" CssClass="cur01st" Text="Observações:"></asp:Label><br />
                                                <asp:Label ID="obsLabel" runat="server" CssClass="cur01" Text='<%# Eval("obs") %>'></asp:Label><br />
                                                <br />
                                                <asp:Label ID="Label23" runat="server" CssClass="cur01st" Text="Início: "></asp:Label><asp:Label
                                                    ID="data_iniLabel" runat="server" CssClass="cur01" Text='<%# Eval("data_ini", "{0:d}") %>'></asp:Label>
                                                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                                <asp:Label ID="Label24" runat="server" CssClass="cur01st" Text="Término: "></asp:Label><asp:Label
                                                    ID="data_fimLabel" runat="server" CssClass="cur01" Text='<%# Eval("data_fim", "{0:d}") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderTemplate>
                                                <br />
                                                <br />
                                                <asp:Image ID="Image5" runat="server" ImageUrl="~/images/candidato/cv/titformacao.gif" />
                                            </HeaderTemplate>
                                            <SeparatorTemplate>
                                                <asp:Image ID="Image4" runat="server" ImageUrl="~/images/candidato/cv/separador.gif" />
                                            </SeparatorTemplate>
                                        </asp:DataList><asp:DataList ID="DataList5" runat="server" DataSourceID="SqlDataSource5">
                                            <ItemTemplate>
                                                <asp:Label ID="InstituicaoLabel" runat="server" CssClass="cur01" Text='<%# Eval("Instituicao") %>'></asp:Label>
                                                <asp:Label ID="idcurriculoLabel" runat="server" Text='<%# Eval("idcurriculo") %>'
                                                    Visible="False"></asp:Label><br />
                                                <asp:Label ID="Label26" runat="server" CssClass="cur01st" Text="Curso:"></asp:Label><br />
                                                <asp:Label ID="dsCursoLabel" runat="server" CssClass="cur01" Text='<%# Eval("dsCurso") %>'></asp:Label><br />
                                                <asp:Label ID="Label27" runat="server" CssClass="cur01st" Text="Observações:"></asp:Label><br />
                                                <asp:Label ID="obsCursoLabel" runat="server" CssClass="cur01" Text='<%# Eval("obsCurso") %>'></asp:Label><br />
                                                <asp:Label ID="Label28" runat="server" CssClass="cur01st" Text="Início: "></asp:Label>
                                                <asp:Label ID="data_iniLabel" runat="server" CssClass="cur01" Text='<%# Eval("data_ini", "{0:d}") %>'></asp:Label>
                                                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
                                                <asp:Label ID="Label29" runat="server" CssClass="cur01st" Text="Término: "></asp:Label>
                                                <asp:Label ID="data_fimLabel" runat="server" CssClass="cur01" Text='<%# Eval("data_fim", "{0:d}") %>'></asp:Label><br />
                                                <br />
                                                <asp:Label ID="Label30" runat="server" CssClass="cur01st" Text="Concluído: "></asp:Label>
                                                <asp:Label ID="concluidoLabel" runat="server" CssClass="cur01" Text='<%# Eval("concluido") %>'></asp:Label>
                                                <asp:Label ID="labelRES" runat="server" Text='<%# Eval("concluido") %>' Visible="False"></asp:Label>
                                            </ItemTemplate>
                                            <HeaderTemplate>
                                                <br />
                                                <br />
                                                <asp:Image ID="Image6" runat="server" ImageUrl="~/images/candidato/cv/titcursocomplementar.gif" />
                                            </HeaderTemplate>
                                            <SeparatorTemplate>
                                                <asp:Image ID="Image7" runat="server" ImageUrl="~/images/candidato/cv/separador.gif" />
                                            </SeparatorTemplate>
                                        </asp:DataList><asp:DataList ID="DataList6" runat="server" DataSourceID="SqlDataSource6" Width="440px">
                                            <ItemTemplate>
                                                <asp:Label ID="dsTipoConhecimentoLabel" runat="server" CssClass="cur01" Text='<%# Eval("dsTipoConhecimento") %>'></asp:Label>
                                                <asp:Label ID="idcurriculoLabel" runat="server" Text='<%# Eval("idcurriculo") %>'
                                                    Visible="False"></asp:Label>
                                                <br />
                                                <asp:Label ID="dsTipoConhecimentoRelLabel" runat="server" CssClass="cur01" Text='<%# Eval("dsTipoConhecimentoRel") %>'></asp:Label>
                                                <br />
                                                <br />
                                                <asp:Label ID="dsGrauExperienciaLabel" runat="server" CssClass="cur01" Text='<%# Eval("dsGrauExperiencia") %>'></asp:Label><br />
                                                <br />
                                                <asp:Label ID="Label32" runat="server" CssClass="cur01st" Text="Observações:"></asp:Label><br />
                                                <asp:Label ID="obsLabel" runat="server" CssClass="cur01" Text='<%# Eval("obs") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderTemplate>
                                                <br />
                                                <br />
                                                <asp:Image ID="Image8" runat="server" ImageUrl="~/images/candidato/cv/titconhecimentoinfo.gif" />
                                            </HeaderTemplate>
                                            <SeparatorTemplate>
                                                <asp:Image ID="Image9" runat="server" ImageUrl="~/images/candidato/cv/separador.gif" />
                                            </SeparatorTemplate>
                                        </asp:DataList><asp:DataList ID="DataList7" runat="server" DataSourceID="SqlDataSource7" Width="440px">
                                            <ItemTemplate>
                                                <asp:Label ID="nomeempresaLabel" runat="server" CssClass="cur01" Text='<%# Eval("nomeempresa") %>'></asp:Label>
                                                <asp:Label ID="idcurriculoLabel" runat="server" Text='<%# Eval("idcurriculo") %>'
                                                    Visible="False"></asp:Label><br />
                                                <br />
                                                <asp:Label ID="Label38" runat="server" CssClass="cur01st" Text="Experiência: "></asp:Label><br />
                                                <asp:Label ID="dsexperienciaLabel" runat="server" CssClass="cur01" Text='<%# Eval("dsexperiencia") %>'></asp:Label><br />
                                                <br />
                                                <asp:Label ID="Label33" runat="server" CssClass="cur01st" Text="Início: "></asp:Label><asp:Label
                                                    ID="data_iniLabel" runat="server" CssClass="cur01" Text='<%# Eval("data_ini", "{0:d}") %>'></asp:Label>
                                                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                                <asp:Label ID="Label34" runat="server" CssClass="cur01st" Text="Término:  "></asp:Label><asp:Label
                                                    ID="data_fimLabel" runat="server" CssClass="cur01" Text='<%# Eval("data_fim", "{0:d}") %>'></asp:Label>
                                                <br />
                                                <br />
                                                <asp:Label ID="Label35" runat="server" CssClass="cur01st" Text="Área de Atuacao:"></asp:Label><br />
                                                <asp:Label ID="dsAreaAtuacaoLabel" runat="server" CssClass="cur01" Text='<%# Eval("dsAreaAtuacao") %>'></asp:Label><br />
                                                <br />
                                                <asp:Label ID="Label36" runat="server" CssClass="cur01st" Text="Relação trabalhista: "></asp:Label><asp:Label
                                                    ID="dsRelacaoTrabalhistaLabel" runat="server" CssClass="cur01" Text='<%# Eval("dsRelacaoTrabalhista") %>'></asp:Label><br />
                                                <asp:Label ID="Label37" runat="server" CssClass="cur01st" Text="Porte da empresa: "></asp:Label><asp:Label
                                                    ID="dsPorteLabel" runat="server" CssClass="cur01" Text='<%# Eval("dsPorte") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderTemplate>
                                                <br />
                                                <br />
                                                <asp:Image ID="Image10" runat="server" ImageUrl="~/images/candidato/cv/titconhecimentoprof.gif" />
                                            </HeaderTemplate>
                                            <SeparatorTemplate>
                                                <asp:Image ID="Image9" runat="server" ImageUrl="~/images/candidato/cv/separador.gif" />
                                            </SeparatorTemplate>
                                        </asp:DataList><asp:DataList ID="DataList8" runat="server" DataSourceID="SqlDataSource8">
                                            <ItemTemplate>
                                                <asp:Label ID="dsidiomaLabel" runat="server" Text='<%# Eval("dsidioma") %>' CssClass="cur01"></asp:Label><br />
                                                <asp:Label ID="dsnivelLabel" runat="server" Text='<%# Eval("dsnivel") %>' CssClass="cur01"></asp:Label><br />
                                                <br />
                                                <asp:Label ID="Label40" runat="server" CssClass="cur01st" Text="Comentários: "></asp:Label><br />
                                                <asp:Label ID="dscomentarioLabel" runat="server" Text='<%# Eval("dscomentario") %>' CssClass="cur01"></asp:Label>
                                            </ItemTemplate>
                                            <HeaderTemplate>
                                                <br />
                                                <br />
                                                <asp:Image ID="Image11" runat="server" ImageUrl="~/images/candidato/cv/titidioma.gif" />
                                            </HeaderTemplate>
                                            <SeparatorTemplate>
                                                <asp:Image ID="Image9" runat="server" ImageUrl="~/images/candidato/cv/separador.gif" />
                                            </SeparatorTemplate>
                                        </asp:DataList><asp:DataList ID="DataList9" runat="server" DataSourceID="SqlDataSource9">
                                            <ItemTemplate>
                                                <asp:Label ID="Label39" runat="server" CssClass="cur01st" Text="Pais: "></asp:Label><asp:Label
                                                    ID="paisLabel" runat="server" CssClass="cur01" Text='<%# Eval("pais") %>'></asp:Label><br />
                                                <asp:Label ID="Label40" runat="server" CssClass="cur01st" Text="Comentários: "></asp:Label><br />
                                                <asp:Label ID="dsIntercambioLabel" runat="server" CssClass="cur01" Text='<%# Eval("dsIntercambio") %>'></asp:Label><br />
                                                <br />
                                                <asp:Label ID="Label33" runat="server" CssClass="cur01st" Text="Início: "></asp:Label><asp:Label
                                                    ID="data_iniLabel" runat="server" CssClass="cur01" Text='<%# Eval("data_ini", "{0:d}") %>'></asp:Label>
                                                &nbsp; &nbsp;&nbsp;
                                                <asp:Label ID="Label34" runat="server" CssClass="cur01st" Text="Término:  "></asp:Label><asp:Label
                                                    ID="data_fimLabel" runat="server" CssClass="cur01" Text='<%# Eval("data_fim", "{0:d}") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderTemplate>
                                                <br />
                                                <br />
                                                <asp:Image ID="Image12" runat="server" ImageUrl="~/images/candidato/cv/titintercambio.gif" />
                                            </HeaderTemplate>
                                            <SeparatorTemplate>
                                                <asp:Image ID="Image9" runat="server" ImageUrl="~/images/candidato/cv/separador.gif" />
                                            </SeparatorTemplate>
                                        </asp:DataList><asp:Label ID="idCurriculoLabel" runat="server" Visible="False"></asp:Label>
                                        <asp:Label ID="Label31" runat="server" Visible="False"></asp:Label>
                                        <asp:Label ID="Label41" runat="server" Visible="False"></asp:Label>
                                        <asp:Label ID="Label42" runat="server" Visible="False"></asp:Label>
                                        <asp:Label ID="Label43" runat="server" Visible="False"></asp:Label>
                                        <asp:Label ID="Label44" runat="server" Visible="False"></asp:Label></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
                
            </td> 
        </tr>
    </table> 
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
            
            SelectCommand="SELECT tbCadastroUser.idCadastroUser, tbCadastroUser.nome, tbCadastroUser.endereco, tbCadastroUser.complemento, tbCadastroUser.cep, tbCadastroUser.bairro, tbCadastroUser.cidade, tbCadastroUser.uf, tbCadastroUser.pais, tbCadastroUser.nascimento, tbCadastroUser.sexo, tbCadastroUser.cadastroTipo, tbCadastroUser.apresentar, tbCadastroUser.estadocivil, tbCadastroUser.nrdependente, tbCadastroUser.portadorDef, tbCadastroUser.trabalhando, tbCadastroUser.resumo, tbCadastroUser.valorRemAtual, tbCadastroUser.valorRemPretendida, tbCadastroUser.localPreferencia, tbCadastroUser.disponibilidade, tbCadastroUser.origem, tbCadastroUser.data, tbCadastroUser.foto, tbuser.email FROM tbCadastroUser INNER JOIN tbuser ON tbCadastroUser.idUser = tbuser.idUser WHERE (tbCadastroUser.idUser = @idUser)">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="0" Name="idUser" QueryStringField="idUser"
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        SelectCommand="SELECT [idUser], [dsDefFala], [dsDefAuditiva], [dsDefMental], [dsDefMotora], [dsDefVisual], [Obs] FROM [vwdeficienciafisica] WHERE ([idUser] = @idUser)">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="0" Name="idUser" QueryStringField="idUser"
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        SelectCommand="SELECT [idcurriculo], [apresentacao], [realizacao], [resumogeral], [objetivo] FROM [tbCartaApresentacao] WHERE ([idcurriculo] = @idcurriculo)">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="0" Name="idcurriculo" QueryStringField="id"
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        SelectCommand="SELECT [idcurriculo], [dsCurso], [obs], [data_ini], [data_fim], [dsinstituicao], [estado], [uf], [dsTipo] FROM [vwformacaoacademica] WHERE ([idcurriculo] = @idcurriculo)">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="0" Name="idcurriculo" QueryStringField="id"
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        SelectCommand="SELECT [idcurriculo], [Instituicao], [dsCurso], [obsCurso], [data_ini], [data_fim], [concluido] FROM [tbCursoExtraCurricular] WHERE ([idcurriculo] = @idcurriculo)">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="0" Name="idcurriculo" QueryStringField="id"
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        SelectCommand="SELECT [idcurriculo], [dsTipoConhecimento], [dsGrauExperiencia], [dsTipoConhecimentoRel], [obs] FROM [vwconhecimentoInfo] WHERE ([idcurriculo] = @idcurriculo)">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="0" Name="idcurriculo" QueryStringField="id"
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        SelectCommand="SELECT [nomeempresa], [dsexperiencia], [data_ini], [data_fim], [dsAreaAtuacao], [dsRelacaoTrabalhista], [dsPorte], [idcurriculo] FROM [vwExperienciaProf] WHERE ([idcurriculo] = @idcurriculo) ORDER BY [data_ini] DESC, [data_fim] DESC">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="0" Name="idcurriculo" QueryStringField="id"
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        SelectCommand="SELECT [idcurriculo], [dsnivel], [dsidioma], [dscomentario] FROM [vwidioma] WHERE ([idcurriculo] = @idcurriculo)">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="0" Name="idcurriculo" QueryStringField="id"
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource9" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        SelectCommand="SELECT [idcurriculo], [pais], [dsIntercambio], [data_ini], [data_fim] FROM [tbintercambio] WHERE ([idcurriculo] = @idcurriculo) ORDER BY [data_ini] DESC, [data_fim] DESC">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="0" Name="idcurriculo" QueryStringField="id"
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

