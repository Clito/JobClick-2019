<%@ Page Title="" Language="VB" MasterPageFile="~/_empresaJC/layout_Page001.master" AutoEventWireup="false" CodeFile="candidatura.aspx.vb" Inherits="_empresaJC_candidatura" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script type="text/javascript">
        $(function () {
            $("#<%=PanelCVCandidato.ClientID%>").dialog
            ({ closeText: '', width: '820', title: "Perfil do Candidato", position: "top", show: { effect: 'drop', direction: "up" }, hide: { effect: 'drop', direction: "up"} });
        });
	</script>
    <asp:Label ID="codigoLabel" runat="server" Visible="False"></asp:Label>
    <asp:Label ID="idCurriculoLabel" runat="server" Visible="False"></asp:Label>
    <br /><h1><asp:Label ID="LabelCabec" runat="server" Text="Candidaturas vindas do site"></asp:Label></h1>
    <table cellpadding="0" cellspacing="0" class="col_16">
        <tr>
            <td>
                <asp:GridView ID="GridViewListaVagas" runat="server" AutoGenerateColumns="False" 
                    BorderStyle="None" DataKeyNames="idVagaPublica,codigo" DataSourceID="SqlDataGrid" 
                    GridLines="None" Width="100%" AllowPaging="True">
                    <PagerSettings Position="TopAndBottom" />
                    <Columns>
                        <asp:BoundField DataField="idVagaPublica" HeaderText="idVagaPublica" 
                            InsertVisible="False" ReadOnly="True" SortExpression="idVagaPublica" 
                            Visible="False" />
                        <asp:BoundField DataField="idCadastroEmpresa" HeaderText="idCadastroEmpresa" 
                            SortExpression="idCadastroEmpresa" Visible="False" />
                        <asp:BoundField DataField="idfuncao" HeaderText="idfuncao" 
                            SortExpression="idfuncao" Visible="False" />
                        <asp:BoundField DataField="codigo" HeaderText="Código" 
                            SortExpression="codigo" />
                        <asp:BoundField DataField="titVagaPublica" HeaderText="Vaga" 
                            SortExpression="titVagaPublica" />
                        <asp:BoundField DataField="dsVagaPublica" HeaderText="dsVagaPublica" 
                            SortExpression="dsVagaPublica" Visible="False" DataFormatString="{0:d}" />
                        <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" 
                            Visible="False" />
                        <asp:BoundField DataField="data" HeaderText="data" SortExpression="data" 
                            Visible="False" />
                        <asp:BoundField DataField="validade" HeaderText="Validade" 
                            SortExpression="validade" DataFormatString="{0:d}" />
                        <asp:BoundField DataField="referencia" HeaderText="referencia" 
                            SortExpression="referencia" Visible="False" />
                        <asp:CheckBoxField DataField="publicar" HeaderText="Publicada" 
                            SortExpression="publicar" />
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                    CommandName="Select" CssClass="button" Text="Candidaturas"></asp:LinkButton>
                            </ItemTemplate>
                            <ItemStyle Width="60px" />
                        </asp:TemplateField>
                    </Columns>
                    <HeaderStyle HorizontalAlign="Left" />
                    <AlternatingRowStyle BackColor="#F2F2F2" />
                </asp:GridView>
                        <br />
                <asp:GridView ID="GridViewCandidatura" runat="server" AllowPaging="True" 
                    AutoGenerateColumns="False" BorderStyle="None" DataKeyNames="idcurriculo" 
                    DataSourceID="SqlDataCANDIDATURA" GridLines="Horizontal" Width="100%">
                    <AlternatingRowStyle BackColor="#EFEFEF" />
                    <Columns>
                        <asp:BoundField DataField="idpublica" HeaderText="idpublica" 
                            InsertVisible="False" ReadOnly="True" SortExpression="idpublica" 
                            Visible="False" />
                        <asp:BoundField DataField="idUser" HeaderText="idUser" SortExpression="idUser" 
                            Visible="False" />
                        <asp:BoundField DataField="idcurriculo" HeaderText="idcurriculo" 
                            SortExpression="idcurriculo" Visible="False" />
                        <asp:BoundField DataField="emailTO" HeaderText="emailTO" 
                            SortExpression="emailTO" Visible="False" />
                        <asp:BoundField DataField="midia" HeaderText="midia" SortExpression="midia" 
                            Visible="False" />
                        <asp:ButtonField CommandName="Select" DataTextField="nome" Text="Nome" 
                            HeaderText="Candidato" >
                        <HeaderStyle HorizontalAlign="Left" />
                        </asp:ButtonField>
                        <asp:BoundField DataField="codigo" HeaderText="Código Vaga" 
                            SortExpression="codigo" >
                        <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="apresentacao" HeaderText="apresentacao" 
                            SortExpression="apresentacao" Visible="False" />
                        <asp:CheckBoxField DataField="status" HeaderText="Status" 
                            SortExpression="status" Visible="False" />
                        <asp:BoundField DataField="idTypeUser" HeaderText="idTypeUser" 
                            SortExpression="idTypeUser" Visible="False" />
                    </Columns>
                    <EmptyDataTemplate>
                        <table ID="Aviso" cellpadding="10" cellspacing="10">
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
                                                    
                                                    
                                                    
                                                    Text="&lt;b&gt;Dica:&lt;/b&gt;&lt;br&gt;Veja se houve candidatura expontânea para as vagas divulgadas por você, o JobClick publica e divulga as suas vagas em diversos meios de comunicação, mas você pode ajudar... Utilize o Twitter ou Facebook para aumentar o alcance de seus anúncios.&lt;br /&gt;Você pode contratar este e outros serviços diretamente com o &lt;b&gt;JobClick&lt;/b&gt; pelo telefone &lt;b&gt;(11) 2459-0286.&lt;/b&gt; ou pelo e-mail: helpdesk@jobclick.com.br"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>
                    <PagerSettings Position="TopAndBottom" />
                </asp:GridView>
                <br />
                <asp:Panel ID="PanelCVCandidato" runat="server">
                    <asp:DataList ID="DataListCV" runat="server" DataSourceID="SqlDADOSPESSOAIS" 
                                                                Width="100%">
                        <ItemTemplate>
                            <asp:Label ID="idCadastroUserLabel" runat="server" 
                                                                        
                                Text='<%# Eval("idCadastroUser") %>' Visible="False" />
                            <asp:Label ID="idUserLabel" runat="server" Text='<%# Eval("idUser") %>' 
                                                                        Visible="False" />
                            <asp:Label ID="apresentarLabel" runat="server" 
                                                                        Text='<%# Eval("apresentar") %>' 
                                Visible="False" />
                            <br />
                            <br />
                            <table ID="CORPOCV" cellpadding="5" cellspacing="5" width="800px">
                                <tr>
                                    <td valign="top" width="100px">
                                        <asp:Image ID="ImageCandidato" runat="server" ImageUrl='<%# Eval("foto") %>' 
                                                                                    
                                            ToolTip='Clique aqui para ver o CV deste profissional' Width="100px" />
                                    </td>
                                    <td align="left" valign="top" width="600px">
                                        <table ID="CV" cellpadding="2" cellspacing="2" width="600px">
                                            <tr>
                                                <td align="right" valign="top" width="200px">
                                                    <asp:Label ID="LabelCVDados9" runat="server" CssClass="textoApresentaINFOCV" 
                                                                                                Text="Nome do Candidato(a):"></asp:Label>
                                                </td>
                                                <td align="left" width="400">
                                                    <asp:Label ID="nomeLabel" runat="server" CssClass="textoApresentaNOMECV" 
                                                                                                Font-Bold="False" 
                                                        Text='<%# Eval("nome") %>' />
                                                    <br />
                                                    <asp:Label ID="cadastroTipoLabel" runat="server" CssClass="textoApresentaCV" 
                                                                                                
                                                        Text='<%# Eval("cadastroTipo") %>' />
                                                    <br />
                                                    <asp:Label ID="emailLabel" runat="server" CssClass="textoApresentaCV" 
                                                                                                Text='<%# Eval("email") %>'></asp:Label>
                                                    <br />
                                                    <asp:DataList ID="DataListTELEFONE" runat="server" 
                                                                                                
                                                        DataSourceID="SqlDataSourceTELEFONE">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Column1Label" runat="server" CssClass="textoApresentaCV" 
                                                                                                        Text='<%# Eval("TELEFONE") %>' />
                                                        </ItemTemplate>
                                                    </asp:DataList>
                                                    <br />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" valign="top" width="200px">
                                                    <asp:Label ID="LabelCVDados8" runat="server" CssClass="textoApresentaINFOCV" 
                                                                                                Text="Sexo:"></asp:Label>
                                                </td>
                                                <td align="left" width="400">
                                                    <asp:Label ID="sexoLabel" runat="server" CssClass="textoApresentaCV" 
                                                                                                Text='<%# Eval("sexo") %>' />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" valign="top" width="200px">
                                                    <asp:Label ID="LabelCVDados0" runat="server" CssClass="textoApresentaINFOCV" 
                                                                                                Text="Área de Atuação:"></asp:Label>
                                                </td>
                                                <td align="left" width="400">
                                                    <asp:Label ID="areaAtuacaoLabel" runat="server" CssClass="textoApresentaCV" 
                                                                                                
                                                        Text='<%# Eval("areaAtuacao") %>' />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" valign="top" width="200px">
                                                    <asp:Label ID="LabelCVDados1" runat="server" CssClass="textoApresentaINFOCV" 
                                                                                                
                                                        Text="Área de interesse (1ª Opção):"></asp:Label>
                                                </td>
                                                <td align="left" width="400">
                                                    <asp:Label ID="interesse01Label" runat="server" CssClass="textoApresentaCV" 
                                                                                                
                                                        Text='<%# Eval("interesse01") %>' />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" valign="top" width="200px">
                                                    <asp:Label ID="LabelCVDados2" runat="server" CssClass="textoApresentaINFOCV" 
                                                                                                
                                                        Text="Área de interesse (2ª Opção):"></asp:Label>
                                                </td>
                                                <td align="left" width="400">
                                                    <asp:Label ID="interesse02Label" runat="server" CssClass="textoApresentaCV" 
                                                                                                
                                                        Text='<%# Eval("interesse02") %>' />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" valign="top" width="200px">
                                                    <asp:Label ID="LabelCVDados3" runat="server" CssClass="textoApresentaINFOCV" 
                                                                                                
                                                        Text="Área de interesse (3ª Opção):"></asp:Label>
                                                </td>
                                                <td align="left" width="400">
                                                    <asp:Label ID="interesse03Label" runat="server" CssClass="textoApresentaCV" 
                                                                                                
                                                        Text='<%# Eval("interesse03") %>' />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" valign="top" width="200px">
                                                    <asp:Label ID="LabelCVDados4" runat="server" CssClass="textoApresentaINFOCV" 
                                                                                                Text="CPF:"></asp:Label>
                                                </td>
                                                <td align="left" width="400">
                                                    <asp:Label ID="cpfLabel" runat="server" CssClass="textoApresentaCV" 
                                                                                                Text='<%# Eval("cpf") %>' />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" valign="top" width="200px">
                                                    <asp:Label ID="LabelCVDados5" runat="server" CssClass="textoApresentaINFOCV" 
                                                                                                Text="Resumo:"></asp:Label>
                                                </td>
                                                <td align="left" width="400">
                                                    <asp:Label ID="resumoLabel" runat="server" CssClass="textoApresentaCV" 
                                                                                                Text='<%# Eval("resumo") %>' />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" bgcolor="#F0F0F0" valign="top" width="200px">
                                                    <asp:Label ID="LabelCVDados6" runat="server" CssClass="textoApresentaINFOCV" 
                                                                                                
                                                        Text="Endereço: (Formas de contato)"></asp:Label>
                                                </td>
                                                <td align="left" bgcolor="#F0F0F0" width="400">
                                                    <asp:Label ID="enderecoLabel" runat="server" CssClass="textoApresentaCV" 
                                                                                                Text='<%# Eval("endereco") %>' />
                                                    <br />
                                                    <asp:Label ID="bairroLabel" runat="server" CssClass="textoApresentaCV" 
                                                                                                Text='<%# Eval("bairro") %>' />
                                                    <br />
                                                    <asp:Label ID="cepLabel" runat="server" CssClass="textoApresentaCV" 
                                                                                                Text='<%# Eval("cep") %>' />
                                                    <br />
                                                    <asp:Label ID="cidadeLabel" runat="server" CssClass="textoApresentaCV" 
                                                                                                Text='<%# Eval("cidade") %>' />
                                                    <asp:Label ID="HIFENlabel1" runat="server" CssClass="textoApresentaCV" 
                                                                                                Text=" - "></asp:Label>
                                                    <asp:Label ID="ufLabel" runat="server" CssClass="textoApresentaCV" 
                                                                                                Text='<%# Eval("uf") %>' />
                                                    <asp:Label ID="HIFENlabel2" runat="server" CssClass="textoApresentaCV" 
                                                                                                Text=" - "></asp:Label>
                                                    <asp:Label ID="paisLabel" runat="server" CssClass="textoApresentaCV" 
                                                                                                Text='<%# Eval("pais") %>' />
                                                    <br />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" valign="top" width="200px">
                                                    <asp:Label ID="LabelCVDados7" runat="server" CssClass="textoApresentaINFOCV" 
                                                                                                Text="Data de Nascimento:"></asp:Label>
                                                </td>
                                                <td align="left" width="400">
                                                    <asp:Label ID="nascimentoLabel" runat="server" CssClass="textoApresentaCV" 
                                                                                                
                                                        Text='<%# Eval("nascimento", "{0:d}") %>' />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" valign="top" width="200px">
                                                    <asp:Label ID="LabelCVDados10" runat="server" CssClass="textoApresentaINFOCV" 
                                                                                                Text="Estado Civil:"></asp:Label>
                                                </td>
                                                <td align="left" width="400">
                                                    <asp:Label ID="estadocivilLabel" runat="server" CssClass="textoApresentaCV" 
                                                                                                
                                                        Text='<%# Eval("estadocivil") %>' />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" valign="top" width="200px">
                                                    <asp:Label ID="LabelCVDados11" runat="server" CssClass="textoApresentaINFOCV" 
                                                                                                Text="Dependentes:"></asp:Label>
                                                </td>
                                                <td align="left" width="400">
                                                    <asp:Label ID="nrdependenteLabel" runat="server" CssClass="textoApresentaCV" 
                                                                                                
                                                        Text='<%# Eval("nrdependente") %>' />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" valign="top" width="200px">
                                                    <asp:Label ID="LabelCVDados12" runat="server" CssClass="textoApresentaINFOCV" 
                                                                                                Text="Situação atual:"></asp:Label>
                                                </td>
                                                <td align="left" width="400">
                                                    <asp:Label ID="trabalhandoLabel" runat="server" CssClass="textoApresentaCV" 
                                                                                                
                                                        Text='<%# Eval("trabalhando") %>' />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" valign="top" width="200px">
                                                    <asp:Label ID="LabelCVDados13" runat="server" CssClass="textoApresentaINFOCV" 
                                                                                                Text="Salário atual:"></asp:Label>
                                                </td>
                                                <td align="left" width="400">
                                                    <asp:Label ID="valorRemAtualLabel" runat="server" CssClass="textoApresentaCV" 
                                                                                                
                                                        Text='<%# Eval("valorRemAtual", "{0:C}") %>' />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" valign="top" width="200px">
                                                    <asp:Label ID="LabelCVDados14" runat="server" CssClass="textoApresentaINFOCV" 
                                                                                                Text="Salário pretendido:"></asp:Label>
                                                </td>
                                                <td align="left" width="400">
                                                    <asp:Label ID="valorRemPretendidaLabel" runat="server" 
                                                                                                CssClass="textoApresentaCV" 
                                                                                                
                                                        Text='<%# Eval("valorRemPretendida", "{0:C}") %>' />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" valign="top" width="200px">
                                                    <asp:Label ID="LabelCVDados15" runat="server" CssClass="textoApresentaINFOCV" 
                                                                                                Text="À combinar:"></asp:Label>
                                                </td>
                                                <td align="left" width="400">
                                                    <asp:Label ID="acombinarLabel" runat="server" CssClass="textoApresentaCV" 
                                                                                                Text='<%# Eval("acombinar") %>' />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" valign="top" width="200px">
                                                    <asp:Label ID="LabelCVDados16" runat="server" CssClass="textoApresentaINFOCV" 
                                                                                                
                                                        Text="Preferência de local de trabalho:"></asp:Label>
                                                </td>
                                                <td align="left" width="400">
                                                    <asp:Label ID="localPreferenciaLabel" runat="server" 
                                                                                                CssClass="textoApresentaCV" 
                                                        Text='<%# Eval("localPreferencia") %>' />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" valign="top" width="200px">
                                                    <asp:Label ID="LabelCVDados17" runat="server" CssClass="textoApresentaINFOCV" 
                                                                                                Text="Disponibilidade:"></asp:Label>
                                                </td>
                                                <td align="left" width="400">
                                                    <asp:Label ID="disponibilidadeLabel" runat="server" CssClass="textoApresentaCV" 
                                                                                                
                                                        Text='<%# Eval("disponibilidade") %>' />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" valign="top" width="200px">
                                                    <asp:Label ID="LabelCVDados18" runat="server" CssClass="textoApresentaINFOCV" 
                                                                                                Text="Ficou sabendo pelo:"></asp:Label>
                                                </td>
                                                <td align="left" width="400">
                                                    <asp:Label ID="origemLabel" runat="server" CssClass="textoApresentaCV" 
                                                                                                Text='<%# Eval("origem") %>' />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" valign="top" width="200px">
                                                    <asp:Label ID="LabelCVDados19" runat="server" CssClass="textoApresentaINFOCV" 
                                                                                                Text="Cadastrado desde:"></asp:Label>
                                                </td>
                                                <td align="left" width="400">
                                                    <asp:Label ID="dataLabel" runat="server" CssClass="textoApresentaCV" 
                                                                                                Text='<%# Eval("data") %>' />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" valign="top" width="200px">
                                                    <asp:Label ID="LabelCVDados20" runat="server" CssClass="textoApresentaINFOCV" 
                                                                                                Text="Último acesso em:"></asp:Label>
                                                </td>
                                                <td align="left" width="400">
                                                    <asp:Label ID="dataultimoacessLabel" runat="server" CssClass="textoApresentaCV" 
                                                                                                
                                                        Text='<%# Eval("dataultimoacess") %>' />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" bgcolor="#F0F0F0" valign="top" width="200px">
                                                    <asp:Label ID="LabelCVDados21" runat="server" CssClass="textoApresentaINFOCV" 
                                                                                                Text="Visualizações deste CV:"></asp:Label>
                                                </td>
                                                <td align="left" bgcolor="#F0F0F0" width="400">
                                                    <asp:Label ID="contadorLabel" runat="server" CssClass="textoApresentaCV" 
                                                                                                Text='<%# Eval("contador") %>' />
                                                    <asp:Label ID="LabelCVDados22" runat="server" CssClass="textoApresentaINFOCV" 
                                                                                                Text="  vezes"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" valign="top" width="200px">
                                                    <asp:Label ID="LabelCVDados23" runat="server" CssClass="textoApresentaINFOCV" 
                                                                                                Text="Quanto a privacidade:"></asp:Label>
                                                </td>
                                                <td align="left" width="400">
                                                    <asp:Label ID="privacidadeLabel" runat="server" CssClass="textoApresentaCV" 
                                                                                                
                                                        Text='<%# Eval("privacidade") %>' />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" valign="top" width="200px">
                                                    <asp:Label ID="LabelCVDados24" runat="server" CssClass="textoApresentaINFOCV" 
                                                                                                Text="Necessidades especiais:"></asp:Label>
                                                </td>
                                                <td align="left" width="400">
                                                    <asp:Label ID="portadorDefLabel" runat="server" CssClass="textoApresentaCV" 
                                                                                                
                                                        Text='<%# Eval("portadorDef") %>' />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" valign="top" width="200px">
                                                    <asp:Label ID="LabelCVDados25" runat="server" CssClass="textoApresentaINFOCV" 
                                                                                                Text="Observações (PNE):"></asp:Label>
                                                </td>
                                                <td align="left" width="400">
                                                    <asp:Label ID="dsDefAuditivaLabel" runat="server" CssClass="textoApresentaCV" 
                                                                                                
                                                        Text='<%# Eval("dsDefAuditiva") %>' />
                                                    <asp:Label ID="dsDefFalaLabel" runat="server" CssClass="textoApresentaCV" 
                                                                                                Text='<%# Eval("dsDefFala") %>' />
                                                    <asp:Label ID="dsDefMotoraLabel" runat="server" CssClass="textoApresentaCV" 
                                                                                                
                                                        Text='<%# Eval("dsDefMotora") %>' />
                                                    <asp:Label ID="dsDefVisualLabel" runat="server" CssClass="textoApresentaCV" 
                                                                                                
                                                        Text='<%# Eval("dsDefVisual") %>' />
                                                    <asp:Label ID="dsDefMentalLabel" runat="server" CssClass="textoApresentaCV" 
                                                                                                
                                                        Text='<%# Eval("dsDefMental") %>' />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" valign="top" width="200px">
                                                    <asp:Label ID="LabelCVDados26" runat="server" CssClass="textoApresentaINFOCV" 
                                                                                                Text="Referência:"></asp:Label>
                                                </td>
                                                <td align="left" width="400">
                                                    <asp:Label ID="VINCULOLabel" runat="server" CssClass="textoApresentaCV" 
                                                                                                Text='<%# Eval("VINCULO") %>'></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" bgcolor="#F0F0F0" valign="top" width="200px">
                                                    <asp:Label ID="Label27" runat="server" CssClass="textoApresentaINFOCV" 
                                                                                                Text="Formação Acadêmica:"></asp:Label>
                                                </td>
                                                <td align="left" bgcolor="#F0F0F0" width="400">
                                                    <asp:DataList ID="DataListFORMACAO" runat="server" 
                                                                                                
                                                        DataSourceID="SqlDataSourceFORMACAO">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Column1Label0" runat="server" CssClass="textoApresentaCV" 
                                                                                                        Text='<%# Eval("Column1") %>' />
                                                            <br />
                                                        </ItemTemplate>
                                                    </asp:DataList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" valign="top" width="200px">
                                                    <asp:Label ID="Label28" runat="server" CssClass="textoApresentaINFOCV" 
                                                                                                Text="Idioma(s):"></asp:Label>
                                                </td>
                                                <td align="left" width="400">
                                                    <asp:DataList ID="DataListIDIOMA" runat="server" 
                                                                                                DataSourceID="SqlDataSourceIDIOMA">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Column1Label1" runat="server" CssClass="textoApresentaCV" 
                                                                                                        Text='<%# Eval("Column1") %>' />
                                                        </ItemTemplate>
                                                    </asp:DataList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" bgcolor="#F0F0F0" valign="top" width="200px">
                                                    <asp:Label ID="Label29" runat="server" CssClass="textoApresentaINFOCV" 
                                                                                                
                                                        Text="Conhecimento(s) em informática:"></asp:Label>
                                                </td>
                                                <td align="left" bgcolor="#F0F0F0" width="400">
                                                    <asp:DataList ID="DataListINFORMATICA" runat="server" 
                                                                                                
                                                        DataSourceID="SqlDataSourceINFORMATICA">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Column1Label2" runat="server" CssClass="textoApresentaCV" 
                                                                                                        Text='<%# Eval("Column1") %>' />
                                                        </ItemTemplate>
                                                    </asp:DataList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" valign="top" width="200px">
                                                    <asp:Label ID="Label30" runat="server" CssClass="textoApresentaINFOCV" 
                                                                                                Text="Trajetória profissional:"></asp:Label>
                                                </td>
                                                <td align="left" width="400">
                                                    <asp:DataList ID="DataListTRAJETORIA" runat="server" 
                                                                                                
                                                        DataSourceID="SqlDataSourceTRAJETORIA">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Column1Label3" runat="server" CssClass="textoApresentaCV" 
                                                                                                        Text='<%# Eval("Column1") %>' />
                                                        </ItemTemplate>
                                                    </asp:DataList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" bgcolor="#F0F0F0" valign="top" width="200px">
                                                    <asp:Label ID="Label32" runat="server" CssClass="textoApresentaINFOCV" 
                                                                                                Text="Apresentação pessoal:"></asp:Label>
                                                    <br />
                                                    <asp:Label ID="Label31" runat="server" CssClass="textoApresentaINFOCV" 
                                                                                                
                                                        Text="Auto-Avaliação Profissional:"></asp:Label>
                                                    <br />
                                                    <asp:Label ID="Label33" runat="server" CssClass="textoApresentaINFOCV" 
                                                                                                Text="Competência Profissional:"></asp:Label>
                                                    <br />
                                                    <asp:Label ID="Label34" runat="server" CssClass="textoApresentaINFOCV" 
                                                                                                Text="Realizações:"></asp:Label>
                                                    <br />
                                                    <asp:Label ID="Label35" runat="server" CssClass="textoApresentaINFOCV" 
                                                                                                Text="Objetivos:"></asp:Label>
                                                </td>
                                                <td align="left" bgcolor="#F0F0F0" width="400">
                                                    <asp:DataList ID="DataListAPRESENTA" runat="server" 
                                                                                                
                                                        DataSourceID="SqlDataSourceAUTOAVALIACAO">
                                                        <ItemTemplate>
                                                            <asp:Label ID="AUTOAVALIACAOLabel" runat="server" CssClass="textoApresentaCV" 
                                                                                                        
                                                                Text='<%# Eval("AUTOAVALIACAO") %>' />
                                                        </ItemTemplate>
                                                    </asp:DataList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" valign="top" width="200px">
                                                    <asp:Label ID="Label36" runat="server" CssClass="textoApresentaINFOCV" 
                                                                                                Text="Videos:"></asp:Label>
                                                </td>
                                                <td align="left" width="400">
                                                    <asp:DataList ID="DataListMULTIMIDIA" runat="server" 
                                                                                                
                                                        DataSourceID="SqlDataSourceMULTIMIDIA">
                                                        <ItemTemplate>
                                                            <asp:Label ID="MULTIMIDIALabel" runat="server" CssClass="textoApresentaCV" 
                                                                                                        Text='<%# Eval("MULTIMIDIA") %>' />
                                                        </ItemTemplate>
                                                    </asp:DataList>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                            &nbsp;<asp:Label ID="idsetupLabel" runat="server" Text='<%# Eval("idsetup") %>' 
                                Visible="False" />
                            &nbsp;<asp:Label ID="idcurriculoLabel" runat="server" 
                                                                        Text='<%# Eval("idcurriculo") %>' 
                                Visible="False" />
                            <asp:Label ID="nmempresaLabel" runat="server" Text='<%# Eval("nmempresa") %>' 
                                                                        Visible="False" />
                            <br />
                            <table ID="BODYRESTANTE" cellpadding="5" cellspacing="5" width="800px">
                                <tr>
                                    <td valign="top" width="130px">
                                    </td>
                                    <td align="left" valign="top" width="670px">
                                    </td>
                                </tr>
                            </table>
                            <br />
                            <asp:SqlDataSource ID="SqlDataSourceFORMACAO" runat="server" 
                                                                        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                                                                        SelectCommand="_USP_PROCESSOSELETIVO_LAUDO_FORMACAO" 
                                                                        
                                SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="idCurriculoLabel" Name="idcurriculo" 
                                                                                PropertyName="Text" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:SqlDataSource ID="SqlDataSourceIDIOMA" runat="server" 
                                                                        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                                                                        SelectCommand="_USP_PROCESSOSELETIVO_LAUDO_IDIOMA" 
                                                                        
                                SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="idCurriculoLabel" Name="idcurriculo" 
                                                                                PropertyName="Text" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:SqlDataSource ID="SqlDataSourceINFORMATICA" runat="server" 
                                                                        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                                                                        SelectCommand="_USP_PROCESSOSELETIVO_LAUDO_INFORMATICA" 
                                                                        
                                SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="idCurriculoLabel" Name="idcurriculo" 
                                                                                PropertyName="Text" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:SqlDataSource ID="SqlDataSourceTRAJETORIA" runat="server" 
                                                                        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                                                                        SelectCommand="_USP_PROCESSOSELETIVO_LAUDO_TRAJETORIA_PROFISSIONAL" 
                                                                        
                                SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="idCurriculoLabel" Name="idcurriculo" 
                                                                                PropertyName="Text" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:SqlDataSource ID="SqlDataSourceTELEFONE" runat="server" 
                                                                        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                                                                        SelectCommand="_USP_PROCESSOSELETIVO_LAUDO_TELEFONE" 
                                                                        
                                SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="idCurriculoLabel" Name="idcurriculo" 
                                                                                PropertyName="Text" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:SqlDataSource ID="SqlDataSourceAUTOAVALIACAO" runat="server" 
                                                                        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                                                                        SelectCommand="_USP_PROCESSOSELETIVO_LAUDO_AUTO_AVALIACAO" 
                                                                        
                                SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="idCurriculoLabel" Name="idcurriculo" 
                                                                                PropertyName="Text" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:SqlDataSource ID="SqlDataSourceMULTIMIDIA" runat="server" 
                                                                        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                                                                        SelectCommand="_USP_PROCESSOSELETIVO_LAUDO_MULTIMIDIA" 
                                                                        
                                SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="idCurriculoLabel" Name="idcurriculo" 
                                                                                PropertyName="Text" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <br />
                        </ItemTemplate>
                    </asp:DataList>
                </asp:Panel>
                <br />
    <asp:SqlDataSource ID="SqlDataGrid" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        
        
        SelectCommand="SELECT [idVagaPublica], [idCadastroEmpresa], [idfuncao], [titVagaPublica], [dsVagaPublica], [email], [data], [validade], [codigo], [referencia], [publicar] FROM [tbVagaPublica] WHERE ([idCadastroEmpresa] = @idCadastroEmpresa) ">
        <SelectParameters>
            <asp:SessionParameter Name="idCadastroEmpresa" SessionField="idCadastroEmpresa" 
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataCANDIDATURA" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                    SelectCommand="_USP_CANDIDATURA_CV_PRATA_CODIGO" 
                    SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="codigoLabel" Name="codigo" PropertyName="Text" 
                            Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                                <asp:SqlDataSource ID="SqlDADOSPESSOAIS" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                                    SelectCommand="_USP_CURRICULO_DADOSPESSOAIS" 
                                    SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="idCurriculoLabel" Name="idCurriculo" 
                                            PropertyName="Text" Type="Int32" />
                                        <asp:SessionParameter Name="idSetup" SessionField="idSetup" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
            </td>
            </tr>
    </table>
    <br />
</asp:Content>

