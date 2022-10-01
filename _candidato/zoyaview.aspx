<%@ Page Language="VB" MasterPageFile="~/_candidato/zoya.master" AutoEventWireup="false" CodeFile="zoyaview.aspx.vb" Inherits="_candidato_zoyaview" title="Jobclick" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:ScriptManager ID="ScriptManager1" runat="server">
                                </asp:ScriptManager>                    
                    <table align="center" border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                        <tr>
                            <td align="left" style="width: 507px">
                                <br />
                                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                                    BorderStyle="None" CellPadding="0" DataKeyNames="idfuncao" 
                                    DataSourceID="SqlFuncao" GridLines="None" ShowHeader="False">
                                    <Columns>
                                        <asp:BoundField DataField="idfuncao" HeaderText="idfuncao" 
                                            InsertVisible="False" ReadOnly="True" SortExpression="idfuncao" 
                                            Visible="False" />
                                        <asp:BoundField DataField="dsfuncao" SortExpression="dsfuncao">
                                            <ItemStyle CssClass="titulo" />
                                        </asp:BoundField>
                                    </Columns>
                                </asp:GridView>
                                <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" 
                                    BorderStyle="None" DataKeyNames="idAreaAtuacao" DataSourceID="SqlArea" 
                                    GridLines="None" ShowHeader="False">
                                    <Columns>
                                        <asp:BoundField DataField="idAreaAtuacao" HeaderText="idAreaAtuacao" 
                                            InsertVisible="False" ReadOnly="True" SortExpression="idAreaAtuacao" 
                                            Visible="False" />
                                        <asp:BoundField DataField="dsAreaAtuacao" HeaderText="dsAreaAtuacao" 
                                            SortExpression="dsAreaAtuacao" />
                                    </Columns>
                                </asp:GridView>
                                <br />
                            </td>
                            <td>
                                <asp:ImageButton ID="ImageButtonCV" runat="server" 
                                    ImageUrl="~/images/candidato/cvZoya.gif" />
                                </td>
                        </tr>
                       
                    </table>
                    <table runat="server" id="AlbumZoyatb" visible="false" 
        cellpadding="0" cellspacing="0" bgcolor="#FFFFCC">
                        <tr>
                            <td>
                                <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" 
                                    BorderStyle="None" DataKeyNames="idAlbumZoyaCategoria" 
                                    DataSourceID="SqlAlbumZoyaCategoria" GridLines="Horizontal" Width="505px">
                                    <Columns>
                                        <asp:BoundField DataField="idAlbumZoyaCategoria" 
                                            HeaderText="idAlbumZoyaCategoria" InsertVisible="False" ReadOnly="True" 
                                            SortExpression="idAlbumZoyaCategoria" Visible="False" />
                                        <asp:BoundField DataField="dsCategoria" HeaderText="Albuns disponíveis no Zoya (Escolha um abaixo)" 
                                            SortExpression="dsCategoria" />
                                        <asp:CommandField SelectText="Selecionar" ShowSelectButton="True">
                                            <ItemStyle Width="70px" />
                                        </asp:CommandField>
                                    </Columns>
                                    <AlternatingRowStyle BackColor="#FFFFEC" />
                                </asp:GridView>
                                <asp:Label ID="idAlbumZoyaCategoriaLabel" runat="server" Visible="False"></asp:Label>
                                <br />
                                <asp:GridView ID="GridView5" runat="server" AllowPaging="True" 
                                    AutoGenerateColumns="False" BorderStyle="None" 
                                    DataKeyNames="idAlbumZoya,Tamanho,Tipo,imageZoya" DataSourceID="SqlAlbumZoya" 
                                    GridLines="Horizontal" PageSize="1">
                                    <PagerSettings Position="Top" />
                                    <Columns>
                                        <asp:BoundField DataField="idAlbumZoya" HeaderText="idAlbumZoya" 
                                            InsertVisible="False" ReadOnly="True" SortExpression="idAlbumZoya" 
                                            Visible="False" />
                                        <asp:TemplateField HeaderText="Clique sobre a imagem para seleciona-la." 
                                            SortExpression="imageZoya">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("imageZoya") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:ImageButton ID="ImageButtonSelect" runat="server" CommandName="Select" 
                                                    ImageUrl='<%# Eval("imageZoya") %>' 
                                                    ToolTip="Clique sobre a imagem para seleciona-la" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="Descricao" HeaderText="Descricao" 
                                            SortExpression="Descricao" Visible="False" />
                                        <asp:BoundField DataField="Tamanho" HeaderText="Tamanho" 
                                            SortExpression="Tamanho" Visible="False" />
                                        <asp:BoundField DataField="Tipo" HeaderText="Tipo" SortExpression="Tipo" 
                                            Visible="False" />
                                        <asp:BoundField DataField="idAlbumZoyaCategoria" 
                                            HeaderText="idAlbumZoyaCategoria" SortExpression="idAlbumZoyaCategoria" 
                                            Visible="False" />
                                        <asp:BoundField DataField="idZoya" HeaderText="idZoya" SortExpression="idZoya" 
                                            Visible="False" />
                                    </Columns>
                                </asp:GridView>
                                <asp:Label ID="msnImagem" runat="server" CssClass="msnOK"></asp:Label>
                            </td>
                        </tr>
                    </table>         
                <table runat="server" id="tbImagem" visible="false" cellpadding="0" cellspacing="0" style="width: 100%">
                    <tr>
                        <td>
                            <asp:Label ID="Label45" runat="server" CssClass="tituloZoya" 
                                Text="Imagem no Zoya"></asp:Label>
                            <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                    ControlToValidate="fileImagemParaGravar" Display="Dynamic" ErrorMessage="* Informe uma imagem válida"
                    SetFocusOnError="True" ValidationGroup="SendFoto"></asp:RequiredFieldValidator><br />
                <asp:FileUpload ID="fileImagemParaGravar" runat="server" />
                            <br />
                            Descrição ou texto relevante sobre a imagem:<asp:RequiredFieldValidator 
                                ID="RequiredFieldValidator5" runat="server" ControlToValidate="Descricao" 
                                Display="Dynamic" ErrorMessage="*" ValidationGroup="SendFoto"></asp:RequiredFieldValidator>
                            <br />
                            <asp:TextBox ID="Descricao" runat="server" CssClass="InputCad" Height="68px" 
                                TextMode="MultiLine" ValidationGroup="SendFoto" Width="545px"></asp:TextBox>
                            <br />
                <asp:Label ID="msnFOTO" runat="server" CssClass="msn"></asp:Label><br />
                <asp:Button ID="Enviar" runat="server" Text="Enviar imagem" ValidationGroup="SendFoto" />                        
                        &nbsp;<asp:Button ID="AlbumZoya" runat="server" 
                                Text="Ver as disponíveis no álbum do Zoya" />
                        </td>
                    </tr>
                </table>                    
                    <asp:Panel ID="PanelCV" runat="server" Visible="False" CssClass="ZoyaPosition">
                        <table cellpadding="0" cellspacing="0" style="width: 100%">
                            <tr>
                                <td align="right">
                                    <asp:ImageButton ID="ImageButtonPanel" runat="server" 
                                        ImageUrl="~/images/fecharportifolio.gif" />
                                </td>
                            </tr>
                        </table>
                        &nbsp;<table width="600" cellpadding="0" cellspacing="0">            
        <tr>
            <td width="600">
            
                <table border="0" width="600" cellpadding="0" cellspacing="0">
                    <tr>
                        <td valign="top" width="135" height="131">
                            <asp:Image ID="ImageCandidato" runat="server" 
                                ImageUrl="~/images/candidato/padraoC.gif" Width="120px" />
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
                                                <asp:Label ID="Label1" runat="server" CssClass="cur01st" Text="Nome:"></asp:Label>
                                                &nbsp;<br />
                                                <asp:Label ID="nomeLabel" runat="server" Text='<%# Eval("nome") %>' CssClass="cur01"></asp:Label><br />
                                                <asp:Label ID="Label2" runat="server" CssClass="cur01st" Text="Endereço: "></asp:Label>
                                                &nbsp;<br />
                                                <asp:Label ID="enderecoLabel" runat="server" Text='<%# Eval("endereco") %>' CssClass="cur01"></asp:Label>
                                                &nbsp;<br />
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
                                                <asp:Label ID="nascimentoLabel" runat="server" Text='<%# Eval("nascimento", "{0:d}") %>' CssClass="cur01"></asp:Label>
                                                &nbsp;<br />
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
                                        </asp:DataList>
                                        <br />
                                        <asp:DataList ID="DataList3" runat="server" DataSourceID="SqlDataSource3">
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
                                                <asp:Label ID="ObsLabel" runat="server" CssClass="cur01" 
                                                    Text='<%# Eval("Obs") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderTemplate>
                                                <br />
                                                <asp:Image ID="ImageDef" runat="server" 
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
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
                
            </td> 
        </tr>
    </table> 
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>" SelectCommand="SELECT [idCadastroUser], [nome], [endereco], [cep], [bairro], [cidade], [uf], [pais], [nascimento], [sexo], [cadastroTipo], [apresentar], [estadocivil], [nrdependente], [portadorDef], [trabalhando], [resumo], [valorRemAtual], [valorRemPretendida], [localPreferencia], [disponibilidade], [origem], [data] FROM [tbCadastroUser] WHERE ([idUser] = @idUser)">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="idUser" SessionField="idUser" 
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        SelectCommand="SELECT [idUser], [dsDefFala], [dsDefAuditiva], [dsDefMental], [dsDefMotora], [dsDefVisual], [Obs] FROM [vwdeficienciafisica] WHERE ([idUser] = @idUser)">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="idUser" SessionField="idUser" 
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        SelectCommand="SELECT [idcurriculo], [apresentacao], [realizacao], [resumogeral], [objetivo] FROM [tbCartaApresentacao] WHERE ([idcurriculo] = @idcurriculo)">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="idcurriculo" 
                SessionField="idcurriculo" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        SelectCommand="SELECT [idcurriculo], [dsCurso], [obs], [data_ini], [data_fim], [dsinstituicao], [estado], [uf], [dsTipo] FROM [vwformacaoacademica] WHERE ([idcurriculo] = @idcurriculo)">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="idcurriculo" 
                SessionField="idcurriculo" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        SelectCommand="SELECT [idcurriculo], [Instituicao], [dsCurso], [obsCurso], [data_ini], [data_fim], [concluido] FROM [tbCursoExtraCurricular] WHERE ([idcurriculo] = @idcurriculo)">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="idcurriculo" 
                SessionField="idcurriculo" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        SelectCommand="SELECT [idcurriculo], [dsTipoConhecimento], [dsGrauExperiencia], [dsTipoConhecimentoRel], [obs] FROM [vwconhecimentoInfo] WHERE ([idcurriculo] = @idcurriculo)">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="idcurriculo" 
                SessionField="idcurriculo" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        SelectCommand="SELECT [nomeempresa], [dsexperiencia], [data_ini], [data_fim], [dsAreaAtuacao], [dsRelacaoTrabalhista], [dsPorte], [idcurriculo] FROM [vwExperienciaProf] WHERE ([idcurriculo] = @idcurriculo) ORDER BY [data_ini] DESC, [data_fim] DESC">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="idcurriculo" 
                SessionField="idcurriculo" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        SelectCommand="SELECT [idcurriculo], [dsnivel], [dsidioma], [dscomentario] FROM [vwidioma] WHERE ([idcurriculo] = @idcurriculo)">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="idcurriculo" 
                SessionField="idcurriculo" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource9" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        SelectCommand="SELECT [idcurriculo], [pais], [dsIntercambio], [data_ini], [data_fim] FROM [tbintercambio] WHERE ([idcurriculo] = @idcurriculo) ORDER BY [data_ini] DESC, [data_fim] DESC">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="idcurriculo" 
                SessionField="idcurriculo" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
                    </asp:Panel>

                    <cc1:DragPanelExtender ID="PanelCV_DragPanelExtender" runat="server" 
                        DragHandleID="PanelCV" Enabled="True" TargetControlID="PanelCV">
                    </cc1:DragPanelExtender>

                    <br />
                    
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="idZoya" 
            DataSourceID="SqlZoyaView" Width="550px">
            <EditItemTemplate>
                <asp:Label ID="NomeResponsavelLabel" runat="server" CssClass="tituloZoyaUser" 
                    Text='<%# Bind("NomeResponsavel") %>' />
                <br />
                <asp:Label ID="emailRecadosLabel" runat="server" 
                    Text='<%# Bind("emailRecados") %>' />
                <br />
                <br />
                <asp:Label ID="imageZoyaLabel" runat="server"></asp:Label>
                <br />
                <br />
                <asp:Label ID="lblGeralFormaContato" runat="server" CssClass="tituloZoya" 
                    Text="Formas de contato"></asp:Label>
                <br />
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    BorderStyle="None" DataKeyNames="idTipoTelefone" DataSourceID="SqlContato" 
                    GridLines="None" ShowHeader="False">
                    <Columns>
                        <asp:TemplateField HeaderText="idTipoTelefone" SortExpression="idTipoTelefone">
                            <EditItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("idTipoTelefone") %>'></asp:Label>
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
                                (<asp:Label ID="Label5" runat="server" Text='<%# Bind("ddd") %>'></asp:Label>
                                )
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="numero" SortExpression="numero">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("numero") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("numero") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="ramal" SortExpression="ramal">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("ramal") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("ramal") %>'></asp:Label>
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
                <asp:Label ID="lblGeral" runat="server" CssClass="tituloZoya" 
                    Text="Apresentação"></asp:Label>
                <br />
                <asp:Label ID="dsGeralLabel" runat="server" Text='<%# Bind("dsGeral") %>' />
                <br />
                <br />
                <b>Editar [Apresentação]</b><br />
                <asp:TextBox ID="dsGeralTextBox" runat="server" CssClass="InputCad" 
                    Height="86px" ondatabinding="dsGeralTextBox_DataBinding" 
                    Text='<%# Bind("dsGeral") %>' TextMode="MultiLine" Width="580px" />
                <br />
                <br />
                <asp:Label ID="lblGeral0" runat="server" CssClass="tituloZoya" 
                    Text="Serviços oferecidos"></asp:Label>
                <br />
                <asp:Label ID="dsServicosOferecidosLabel" runat="server" 
                    Text='<%# Bind("dsServicosOferecidos") %>' />
                <br />
                <br />
                <b>Editar [Serviços oferecidos]</b><br />
                <asp:TextBox ID="dsServicosOferecidosTextBox" runat="server" 
                    CssClass="InputCad" Height="86px" 
                    ondatabinding="dsServicosOferecidosTextBox_DataBinding" 
                    Text='<%# Bind("dsServicosOferecidos") %>' TextMode="MultiLine" Width="580px" />
                <br />
                <br />
                <asp:Label ID="lblGeral1" runat="server" CssClass="tituloZoya" 
                    Text="Trabalhos publicados"></asp:Label>
                <br />
                <asp:Label ID="dsTrabalhosPublicadosLabel" runat="server" 
                    Text='<%# Bind("dsTrabalhosPublicados") %>' />
                <br />
                <br />
                <b>Editar [Trabalhos publicados]</b><br />
                <asp:TextBox ID="dsTrabalhosPublicadosTextBox" runat="server" 
                    CssClass="InputCad" Height="86px" 
                    ondatabinding="dsTrabalhosPublicadosTextBox_DataBinding" 
                    Text='<%# Bind("dsTrabalhosPublicados") %>' TextMode="MultiLine" 
                    Width="580px" />
                <br />
                <asp:CheckBox ID="apresentarMultimidiaCheckBox0" runat="server" 
                    Checked='<%# Bind("apresentarMultimidia") %>' Enabled="false" Visible="False" />
                <asp:CheckBox ID="apresentarCVCheckBox0" runat="server" 
                    Checked='<%# Bind("apresentarCV") %>' Enabled="false" Visible="False" />
                <asp:CheckBox ID="publicarCheckBox0" runat="server" 
                    Checked='<%# Bind("publicar") %>' Enabled="False" Text="Publicar no Zoya." 
                    Visible="False" />
                <asp:CheckBox ID="apresentarContatoCheckBox0" runat="server" 
                    Checked='<%# Bind("apresentarContato") %>' Enabled="false" Visible="False" />
                <asp:Label ID="idZoyaLabel" runat="server" Text='<%# Eval("idZoya") %>' 
                    Visible="False" />
                <asp:Label ID="idCadastroUserLabel" runat="server" 
                    Text='<%# Bind("idCadastroUser") %>' Visible="False" />
                <asp:Label ID="idfuncaoLabel" runat="server" Text='<%# Bind("idfuncao") %>' 
                    Visible="False" />
                <asp:Label ID="idAreaAtuacaoPLabel" runat="server" 
                    Text='<%# Bind("idAreaAtuacaoP") %>' Visible="False" />
                <asp:Label ID="idAreaAtuacaoSLabel" runat="server" 
                    Text='<%# Bind("idAreaAtuacaoS") %>' Visible="False" />
                <asp:Label ID="idcurriculoLabel" runat="server" 
                    Text='<%# Bind("idcurriculo") %>' Visible="False" />
                <asp:TextBox ID="idCadastroUserTextBox" runat="server" 
                    Text='<%# Bind("idCadastroUser") %>' Visible="False" Width="32px" />
                <asp:TextBox ID="idfuncaoTextBox" runat="server" 
                    Text='<%# Bind("idfuncao") %>' Visible="False" Width="26px" />
                <asp:TextBox ID="idAreaAtuacaoPTextBox" runat="server" 
                    Text='<%# Bind("idAreaAtuacaoP") %>' Visible="False" Width="31px" />
                <asp:TextBox ID="idAreaAtuacaoSTextBox" runat="server" 
                    Text='<%# Bind("idAreaAtuacaoS") %>' Visible="False" Width="30px" />
                <asp:TextBox ID="idcurriculoTextBox" runat="server" 
                    Text='<%# Bind("idcurriculo") %>' Visible="False" Width="30px" />
                <br />
                <asp:CheckBox ID="apresentarMultimidiaCheckBox" runat="server" 
                    Checked='<%# Bind("apresentarMultimidia") %>' 
                    Text="Apresentar vídeos na publicação" />
                <br />
                <asp:CheckBox ID="apresentarCVCheckBox" runat="server" 
                    Checked='<%# Bind("apresentarCV") %>' 
                    Text="Apresentar portifólio na publicação" />
                <br />
                <asp:CheckBox ID="apresentarContatoCheckBox" runat="server" 
                    Checked='<%# Bind("apresentarContato") %>' 
                    Text="Apresentar forma de contato na publicação (Tornar público)" />
                <br />
                <asp:CheckBox ID="publicarCheckBox" runat="server" 
                    Checked='<%# Bind("publicar") %>' Text="Publicar Marketing Pessoal no Zoya" />
                <br />
                <br />
                Informe qual o CV (protifólio) que será apresentado:<br />
                <asp:DropDownList ID="DropDownListCV" runat="server" CssClass="DropCad" 
                    DataSourceID="SqlCurriculoZoya" DataTextField="dscurriculo" 
                    DataValueField="idcurriculo" Width="577px">
                </asp:DropDownList>
                <br />
                <br />
                Nome para apresentação:<br />
                <asp:TextBox ID="NomeResponsavelTextBox" runat="server" 
                    Text='<%# Bind("NomeResponsavel") %>' CssClass="InputCad" Width="570px" />
                <br />
                <br />
                E-mail para recados:
                <br />
                <asp:TextBox ID="emailRecadosTextBox" runat="server" 
                    Text='<%# Bind("emailRecados") %>' CssClass="InputCad" Width="570px" />
                <br />
                &nbsp;<br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                    CommandName="Update" Text="Salvar atualização" CssClass="tituloZoyaUser" 
                    oncommand="getCommand" />
                &nbsp;|&nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Cancel" Text="Cancelar" 
                    CssClass="tituloZoyaUser" oncommand="getCommand" />
                <br />
                <asp:SqlDataSource ID="SqlCurriculoZoya" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                    SelectCommand="SELECT [idcurriculo], [dscurriculo] FROM [tbCurriculo] WHERE ([idCadastroUser] = @idCadastroUser)">
                    <SelectParameters>
                        <asp:SessionParameter Name="idCadastroUser" SessionField="idCadastroUser" 
                            Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </EditItemTemplate>
            <InsertItemTemplate>
                idCadastroUser:
                <asp:TextBox ID="idCadastroUserTextBox" runat="server" 
                    Text='<%# Bind("idCadastroUser") %>' />
                <br />
                idfuncao:
                <asp:TextBox ID="idfuncaoTextBox" runat="server" 
                    Text='<%# Bind("idfuncao") %>' />
                <br />
                idAreaAtuacaoP:
                <asp:TextBox ID="idAreaAtuacaoPTextBox" runat="server" 
                    Text='<%# Bind("idAreaAtuacaoP") %>' />
                <br />
                idAreaAtuacaoS:
                <asp:TextBox ID="idAreaAtuacaoSTextBox" runat="server" 
                    Text='<%# Bind("idAreaAtuacaoS") %>' />
                <br />
                idcurriculo:
                <asp:TextBox ID="idcurriculoTextBox" runat="server" 
                    Text='<%# Bind("idcurriculo") %>' />
                <br />
                dsGeral:
                <asp:TextBox ID="dsGeralTextBox" runat="server" Text='<%# Bind("dsGeral") %>' />
                <br />
                dsServicosOferecidos:
                <asp:TextBox ID="dsServicosOferecidosTextBox" runat="server" 
                    Text='<%# Bind("dsServicosOferecidos") %>' />
                <br />
                dsTrabalhosPublicados:
                <asp:TextBox ID="dsTrabalhosPublicadosTextBox" runat="server" 
                    Text='<%# Bind("dsTrabalhosPublicados") %>' />
                <br />
                apresentarMultimidia:
                <asp:CheckBox ID="apresentarMultimidiaCheckBox" runat="server" 
                    Checked='<%# Bind("apresentarMultimidia") %>' />
                <br />
                apresentarCV:
                <asp:CheckBox ID="apresentarCVCheckBox" runat="server" 
                    Checked='<%# Bind("apresentarCV") %>' />
                <br />
                apresentarContato:
                <asp:CheckBox ID="apresentarContatoCheckBox" runat="server" 
                    Checked='<%# Bind("apresentarContato") %>' />
                <br />
                NomeResponsavel:
                <asp:TextBox ID="NomeResponsavelTextBox" runat="server" 
                    Text='<%# Bind("NomeResponsavel") %>' />
                <br />
                emailRecados:
                <asp:TextBox ID="emailRecadosTextBox" runat="server" 
                    Text='<%# Bind("emailRecados") %>' />
                <br />
                publicar:
                <asp:CheckBox ID="publicarCheckBox" runat="server" 
                    Checked='<%# Bind("publicar") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                    CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                <table cellpadding="0" cellspacing="0" style="width: 100%" width="550">
                    <tr>
                        <td style="width: 391px">
                            <asp:Label ID="NomeResponsavelLabel" runat="server" CssClass="tituloZoyaUser" 
                                Text='<%# Bind("NomeResponsavel") %>' />
                        </td>
                        <td align="right">
                            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                                CommandName="Edit" CssClass="tituloZoyaUser" Text="Editar profile" 
                                oncommand="getCommand" />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 391px">
                            <asp:Label ID="emailRecadosLabel" runat="server" 
                                Text='<%# Bind("emailRecados") %>' />
                        </td>
                        <td align="right">
                            &nbsp;</td>
                    </tr>
                </table>
                <asp:CheckBox ID="apresentarMultimidiaCheckBox" runat="server" 
                    Checked='<%# Bind("apresentarMultimidia") %>' Enabled="false" Visible="False" />
                <asp:CheckBox ID="apresentarCVCheckBox" runat="server" 
                    Checked='<%# Bind("apresentarCV") %>' Enabled="false" Visible="False" />
                <asp:CheckBox ID="publicarCheckBox" runat="server" 
                    Checked='<%# Bind("publicar") %>' Enabled="False" Text="Publicar no Zoya." 
                    Visible="False" />
                <asp:CheckBox ID="apresentarContatoCheckBox" runat="server" 
                    Checked='<%# Bind("apresentarContato") %>' Enabled="false" 
                    Visible="False" />
                <asp:Label ID="idZoyaLabel" runat="server" Text='<%# Eval("idZoya") %>' 
                    Visible="False" />
                <asp:Label ID="idCadastroUserLabel" runat="server" 
                    Text='<%# Bind("idCadastroUser") %>' Visible="False" />
                <asp:Label ID="idfuncaoLabel" runat="server" Text='<%# Bind("idfuncao") %>' 
                    Visible="False" />
                <asp:Label ID="idAreaAtuacaoPLabel" runat="server" 
                    Text='<%# Bind("idAreaAtuacaoP") %>' Visible="False" />
                <asp:Label ID="idAreaAtuacaoSLabel" runat="server" 
                    Text='<%# Bind("idAreaAtuacaoS") %>' Visible="False" />
                <asp:Label ID="idcurriculoLabel" runat="server" 
                    Text='<%# Bind("idcurriculo") %>' Visible="False" />
                <br />
                <asp:Label ID="imageZoyaLabel" runat="server"></asp:Label>
                <br />
                <br />
                <asp:Label ID="lblGeralFormaContato" runat="server" CssClass="tituloZoya" 
                    Text="Formas de contato"></asp:Label>
                <br />
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    BorderStyle="None" DataKeyNames="idTipoTelefone" DataSourceID="SqlContato" 
                    GridLines="None" ShowHeader="False">
                    <Columns>
                        <asp:TemplateField HeaderText="idTipoTelefone" SortExpression="idTipoTelefone">
                            <EditItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("idTipoTelefone") %>'></asp:Label>
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
                                (<asp:Label ID="Label5" runat="server" Text='<%# Bind("ddd") %>'></asp:Label>
                                )
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="numero" SortExpression="numero">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("numero") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("numero") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="ramal" SortExpression="ramal">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("ramal") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("ramal") %>'></asp:Label>
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
                <asp:Label ID="lblGeral" runat="server" CssClass="tituloZoya" 
                    Text="Apresentação&lt;br&gt;"></asp:Label>
                <asp:Label ID="dsGeralLabel" runat="server" Text='<%# Bind("dsGeral") %>' />
                <br />
                <asp:Label ID="lblGeral0" runat="server" CssClass="tituloZoya" 
                    Text="&lt;br&gt;Serviços oferecidos&lt;br&gt;"></asp:Label>
                <asp:Label ID="dsServicosOferecidosLabel" runat="server" 
                    Text='<%# Bind("dsServicosOferecidos") %>' />
                <br />
                <asp:Label ID="lblGeral1" runat="server" CssClass="tituloZoya" 
                    Text="&lt;br&gt;Trabalhos publicados&lt;br&gt;"></asp:Label>
                <asp:Label ID="dsTrabalhosPublicadosLabel" runat="server" 
                    Text='<%# Bind("dsTrabalhosPublicados") %>' />
                <br />
            </ItemTemplate>
            <EmptyDataTemplate>
                <b>Ops...</b><br />
                <br />
                Para participar do <b>Marketing Pessoal</b> Zoya você deverá criar um profile.<br />
                <br />
                <asp:LinkButton ID="LinkButton1" runat="server" 
                    PostBackUrl="~/_candidato/zoya.aspx">[Clique aqui]</asp:LinkButton>
            </EmptyDataTemplate>
        </asp:FormView>

                <br />

                <asp:Label ID="lblGeralVideos" runat="server" CssClass="tituloZoya" 
                    Text="Vídeos"></asp:Label>
                    <br />
                    <br />
                <asp:Label ID="ConteudoMultimidia" runat="server" Text=""></asp:Label>
                <asp:FormView ID="FormView2" runat="server" DataKeyNames="idMultimidia" 
                        DataSourceID="SqlMultimidia" CellPadding="0" DefaultMode="Edit" Width="350px">
                    <EditItemTemplate>
                        URL: (YouTube válida)<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                            ControlToValidate="urlTextBox" Display="Dynamic" ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <asp:TextBox ID="idCadastroUserTextBox" runat="server" 
                            Text='<%# Bind("idCadastroUser") %>' Visible="False"></asp:TextBox>
                        <br />
                        <asp:TextBox ID="urlTextBox" runat="server" CssClass="InputCad" Text='<%# Bind("url") %>'></asp:TextBox><br />
                        Descrição da apresentação:<asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                            runat="server" ControlToValidate="dsMultimídiaTextBox" Display="Dynamic" ErrorMessage="*"
                            SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                        <asp:TextBox ID="dsMultimídiaTextBox" runat="server" 
                            Text='<%# Bind("dsMultimídia") %>' CssClass="InputCad" Height="100px" 
                            TextMode="MultiLine" ondatabinding="dsMultimídiaTextBox_DataBinding"></asp:TextBox><br />
                        <br />
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                            Text="Atualizar apresentação"></asp:LinkButton>
                        |
                        <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete"
                            OnClientClick='return confirm("Você quer excluir este vídeo do seu portifólio?")'
                            Text="Excluir video"></asp:LinkButton>
                        |
                        <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                            Text="Cancelar" OnClick="UpdateCancelButton_Click"></asp:LinkButton>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        URL: (YouTube válida)<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                            ControlToValidate="urlTextBox" Display="Dynamic" ErrorMessage="*" 
                            SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <asp:TextBox ID="idCadastroUserTextBox" runat="server" 
                            Text='<%# Bind("idCadastroUser") %>' Visible="False"></asp:TextBox>
                        <br />
                        <asp:TextBox ID="urlTextBox" runat="server" CssClass="InputCad" Text='<%# Bind("url") %>'></asp:TextBox><br />
                        Descrição da apresentação:<asp:RequiredFieldValidator ID="RequiredFieldValidator4"
                            runat="server" ControlToValidate="dsMultimídiaTextBox" Display="Dynamic" ErrorMessage="*"
                            SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                        <asp:TextBox ID="dsMultimídiaTextBox" runat="server" CssClass="InputCad" Height="100px"
                            Text='<%# Bind("dsMultimídia") %>' TextMode="MultiLine"></asp:TextBox><br />
                        <br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                            Text="Incluir este vídeo para apresentação"></asp:LinkButton>
                        |
                        <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                            Text="Cancelar"></asp:LinkButton>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        idMultimidia:
                        <asp:Label ID="idMultimidiaLabel" runat="server" Text='<%# Eval("idMultimidia") %>'>
                        </asp:Label><br />
                        idCadastroUser:
                        <asp:Label ID="idCadastroUserLabel" runat="server" Text='<%# Bind("idCadastroUser") %>'>
                        </asp:Label><br />
                        url:
                        <asp:Label ID="urlLabel" runat="server" Text='<%# Bind("url") %>'></asp:Label><br />
                        dsMultimídia:
                        <asp:Label ID="dsMultimídiaLabel" runat="server" Text='<%# Bind("dsMultimídia") %>'>
                        </asp:Label><br />
                        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
                            Text="Edit">
                        </asp:LinkButton>
                        <asp:LinkButton ID="DeleteButton0" runat="server" CausesValidation="False" CommandName="Delete"
                            Text="Delete">
                        </asp:LinkButton>
                        <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                            Text="New">
                        </asp:LinkButton>
                    </ItemTemplate>
                    <EmptyDataTemplate>
                        <asp:Image ID="Image4" runat="server" ImageUrl="~/images/pesquisa.gif" />
                        <asp:LinkButton ID="NewButton0" runat="server" CausesValidation="False" CommandName="New"
                            Text="Incluir vídeo para apresentação em seu currículo"></asp:LinkButton>
                    </EmptyDataTemplate>
                </asp:FormView>

        <asp:Label ID="lblidfuncaoRES" runat="server" Visible="False"></asp:Label>

                    <asp:Label ID="lblAreaRES" runat="server" Visible="False"></asp:Label>

                    <br />
                    <br />
                    <asp:DataList ID="DataListDp" runat="server" DataKeyField="idDepoimentosZoya" 
                        DataSourceID="SqlDepoimentos">
                        <ItemTemplate>
                            <br />
                            <asp:Label ID="txdepoimentoLabel" runat="server" 
                                Text='<%# Eval("txdepoimento") %>' />
                            <br />
                            &nbsp;<br />
                            <asp:Label ID="dataLabel" runat="server" Text='<%# Eval("data") %>' />
                            <br />
                        </ItemTemplate>
                        <HeaderTemplate>
                            <asp:Label ID="lblGeralVideos" runat="server" CssClass="tituloZoya" 
                                Text="Comentários de empresas e profissionais da área"></asp:Label>
                        </HeaderTemplate>
                    </asp:DataList>

<br />
        <asp:SqlDataSource ID="SqlZoyaView" runat="server" 
            ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
            DeleteCommand="DELETE FROM [tbZoya] WHERE [idZoya] = @idZoya" 
            InsertCommand="INSERT INTO [tbZoya] ([idCadastroUser], [idfuncao], [idAreaAtuacaoP], [idAreaAtuacaoS], [idcurriculo], [dsGeral], [dsServicosOferecidos], [dsTrabalhosPublicados], [apresentarMultimidia], [apresentarCV], [apresentarContato], [NomeResponsavel], [emailRecados], [publicar]) VALUES (@idCadastroUser, @idfuncao, @idAreaAtuacaoP, @idAreaAtuacaoS, @idcurriculo, @dsGeral, @dsServicosOferecidos, @dsTrabalhosPublicados, @apresentarMultimidia, @apresentarCV, @apresentarContato, @NomeResponsavel, @emailRecados, @publicar)" 
            SelectCommand="SELECT [idZoya], [idCadastroUser], [idfuncao], [idAreaAtuacaoP], [idAreaAtuacaoS], [idcurriculo], [dsGeral], [dsServicosOferecidos], [dsTrabalhosPublicados], [apresentarMultimidia], [apresentarCV], [apresentarContato], [NomeResponsavel], [emailRecados], [publicar] FROM [tbZoya] WHERE ([idCadastroUser] = @idCadastroUser)" 
            UpdateCommand="UPDATE [tbZoya] SET [idCadastroUser] = @idCadastroUser, [idfuncao] = @idfuncao, [idAreaAtuacaoP] = @idAreaAtuacaoP, [idAreaAtuacaoS] = @idAreaAtuacaoS, [idcurriculo] = @idcurriculo, [dsGeral] = @dsGeral, [dsServicosOferecidos] = @dsServicosOferecidos, [dsTrabalhosPublicados] = @dsTrabalhosPublicados, [apresentarMultimidia] = @apresentarMultimidia, [apresentarCV] = @apresentarCV, [apresentarContato] = @apresentarContato, [NomeResponsavel] = @NomeResponsavel, [emailRecados] = @emailRecados, [publicar] = @publicar WHERE [idZoya] = @idZoya">
            <SelectParameters>
                <asp:SessionParameter Name="idCadastroUser" SessionField="idCadastroUser" 
                    Type="Int32" />
            </SelectParameters>
            <DeleteParameters>
                <asp:Parameter Name="idZoya" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="idCadastroUser" Type="Int32" />
                <asp:Parameter Name="idfuncao" Type="Int32" />
                <asp:Parameter Name="idAreaAtuacaoP" Type="Int32" />
                <asp:Parameter Name="idAreaAtuacaoS" Type="Int32" />
                <asp:Parameter Name="idcurriculo" Type="Int32" />
                <asp:Parameter Name="dsGeral" Type="String" />
                <asp:Parameter Name="dsServicosOferecidos" Type="String" />
                <asp:Parameter Name="dsTrabalhosPublicados" Type="String" />
                <asp:Parameter Name="apresentarMultimidia" Type="Boolean" />
                <asp:Parameter Name="apresentarCV" Type="Boolean" />
                <asp:Parameter Name="apresentarContato" Type="Boolean" />
                <asp:Parameter Name="NomeResponsavel" Type="String" />
                <asp:Parameter Name="emailRecados" Type="String" />
                <asp:Parameter Name="publicar" Type="Boolean" />
                <asp:Parameter Name="idZoya" Type="Int32" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="idCadastroUser" Type="Int32" />
                <asp:Parameter Name="idfuncao" Type="Int32" />
                <asp:Parameter Name="idAreaAtuacaoP" Type="Int32" />
                <asp:Parameter Name="idAreaAtuacaoS" Type="Int32" />
                <asp:Parameter Name="idcurriculo" Type="Int32" />
                <asp:Parameter Name="dsGeral" Type="String" />
                <asp:Parameter Name="dsServicosOferecidos" Type="String" />
                <asp:Parameter Name="dsTrabalhosPublicados" Type="String" />
                <asp:Parameter Name="apresentarMultimidia" Type="Boolean" />
                <asp:Parameter Name="apresentarCV" Type="Boolean" />
                <asp:Parameter Name="apresentarContato" Type="Boolean" />
                <asp:Parameter Name="NomeResponsavel" Type="String" />
                <asp:Parameter Name="emailRecados" Type="String" />
                <asp:Parameter Name="publicar" Type="Boolean" />
            </InsertParameters>
        </asp:SqlDataSource>

                    <asp:SqlDataSource ID="SqlMultimidia" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                        
                        SelectCommand="SELECT [idMultimidia], [idCadastroUser], [url], [dsMultimídia] FROM [tbMultimidia] WHERE ([idMultimidia] = @idMultimidia)" 
                        DeleteCommand="DELETE FROM [tbMultimidia] WHERE [idMultimidia] = @idMultimidia" 
                        InsertCommand="INSERT INTO [tbMultimidia] ([idCadastroUser], [url], [dsMultimídia]) VALUES (@idCadastroUser, @url, @dsMultimídia)" 
                        UpdateCommand="UPDATE [tbMultimidia] SET [idCadastroUser] = @idCadastroUser, [url] = @url, [dsMultimídia] = @dsMultimídia WHERE [idMultimidia] = @idMultimidia">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="idMultimidia" QueryStringField="idMultimidia" 
                                Type="Int32" />
                        </SelectParameters>
                        <DeleteParameters>
                            <asp:Parameter Name="idMultimidia" Type="Int32" />
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="idCadastroUser" Type="Int32" />
                            <asp:Parameter Name="url" Type="String" />
                            <asp:Parameter Name="dsMultimídia" Type="String" />
                            <asp:Parameter Name="idMultimidia" Type="Int32" />
                        </UpdateParameters>
                        <InsertParameters>
                            <asp:Parameter Name="idCadastroUser" Type="Int32" />
                            <asp:Parameter Name="url" Type="String" />
                            <asp:Parameter Name="dsMultimídia" Type="String" />
                        </InsertParameters>
                    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlContato" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        
                        SelectCommand="SELECT tbTelefone.ddd, tbTelefone.numero, tbTelefone.ramal, tbTipoTelefone.idTipoTelefone, tbTelefone.idCadastroUser FROM tbTelefone INNER JOIN tbTipoTelefone ON tbTelefone.idTipoTelefone = tbTipoTelefone.idTipoTelefone WHERE (tbTelefone.idCadastroUser = @idCadastroUser)">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="idCadastroUser" SessionField="idCadastroUser" />
        </SelectParameters>
    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlFuncao" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                        SelectCommand="SELECT [idfuncao], [dsfuncao] FROM [tbFuncao] WHERE ([idfuncao] = @idfuncao)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="lblidfuncaoRES" Name="idfuncao" 
                                PropertyName="Text" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                    <asp:SqlDataSource ID="SqlArea" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                        SelectCommand="SELECT [idAreaAtuacao], [dsAreaAtuacao] FROM [tbAreaAtuacao] WHERE ([idAreaAtuacao] = @idAreaAtuacao)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="lblAreaRES" Name="idAreaAtuacao" 
                                PropertyName="Text" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                    <asp:SqlDataSource ID="SqlDepoimentos" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                        
                        SelectCommand="SELECT [idDepoimentosZoya], [idCadastroUser], [txdepoimento], [apresentar], [data] FROM [tbDepoimentosZoya] WHERE (([idCadastroUser] = @idCadastroUser) AND ([apresentar] = @apresentar))">
                        <SelectParameters>
                            <asp:SessionParameter Name="idCadastroUser" SessionField="idCadastroUser" 
                                Type="Int32" />
                            <asp:Parameter DefaultValue="True" Name="apresentar" Type="Boolean" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                    <asp:SqlDataSource ID="SqlImageZoya" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                        SelectCommand="SELECT [idZoya], [imageZoya], [Descricao], [Tamanho], [Tipo] FROM [tbZoya] WHERE ([idZoya] = @idZoya)">
                        <SelectParameters>
                            <asp:SessionParameter Name="idZoya" SessionField="idZoya" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlAlbumZoya" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        
        SelectCommand="SELECT [idAlbumZoya], [imageZoya], [Descricao], [Tamanho], [Tipo], [idAlbumZoyaCategoria], [idZoya] FROM [tbAlbumZoya] WHERE (([idAlbumZoyaCategoria] = @idAlbumZoyaCategoria) AND ([idZoya] = @idZoya))">
        <SelectParameters>
            <asp:ControlParameter ControlID="idAlbumZoyaCategoriaLabel" DefaultValue="0" 
                Name="idAlbumZoyaCategoria" PropertyName="Text" Type="Int32" />
            <asp:Parameter DefaultValue="0" Name="idZoya" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlAlbumZoyaCategoria" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        SelectCommand="SELECT [idAlbumZoyaCategoria], [dsCategoria] FROM [tbAlbumZoyaCategoria]">
    </asp:SqlDataSource>

</asp:Content>

