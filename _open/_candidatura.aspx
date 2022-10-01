<%@ Page Title="" Language="VB" MasterPageFile="~/_empresa/EmpresaPage.master" AutoEventWireup="false" CodeFile="_candidatura.aspx.vb" Inherits="_empresaJC_candidatura" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
                    <asp:Label ID="LabelCabec" runat="server" CssClass="tituloEmpresa"></asp:Label>
    <asp:Label ID="codigoLabel" runat="server" Visible="False"></asp:Label>
                    <br />
                    <br />
    <table width="640" cellpadding="0" cellspacing="0">
        <tr>
            <td width="26" valign="top">
                <asp:ImageButton ID="ImageButtonPSQL" runat="server" 
                    ImageUrl="~/images/20px.gif" />
            </td>
            <td width="614">
                <asp:GridView ID="GridViewListaVagas" runat="server" AutoGenerateColumns="False" 
                    BorderStyle="None" DataKeyNames="idVagaPublica,codigo" DataSourceID="SqlDataGrid" 
                    GridLines="None" Width="614px" AllowPaging="True">
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
                        <asp:CommandField SelectText="Candidaturas" ShowSelectButton="True">
                            <ItemStyle Width="60px" />
                        </asp:CommandField>
                    </Columns>
                    <HeaderStyle HorizontalAlign="Left" />
                    <AlternatingRowStyle BackColor="Azure" />
                </asp:GridView>
                <asp:GridView ID="GridViewCandidatura" runat="server" AllowPaging="True" 
                    AutoGenerateColumns="False" BorderStyle="None" DataKeyNames="idUser,idcurriculo,idpublica" 
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
                        <asp:ButtonField CommandName="Select" DataTextField="nome" Text="Nome" />
                        <asp:BoundField DataField="codigo" HeaderText="Código Vaga" 
                            SortExpression="codigo" />
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
                                                    
                                                    
                                                    Text="&lt;b&gt;Dica:&lt;/b&gt;&lt;br&gt;Veja se houve candidatura expontânea para as vagas criadas por você, o JobClick publica e divulga as suas vagas em diversos meios de comunicação, mas você pode ajudar... Utilize o Twitter ou Facebook para aumentar o alcance de seus anúncios.&lt;br /&gt;Você pode contratar este e outros serviços diretamente com o &lt;b&gt;JobClick&lt;/b&gt; pelo telefone &lt;b&gt;(11) 2459-0286.&lt;/b&gt; ou pelo e-mail: helpdesk@jobclick.com.br"></asp:Label>
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
  <asp:Panel ID="PanelCV" runat="server" CssClass="CVPosition" Visible="False">
  <table ID="CloseTb" width="100%"><tr><td align="right">
      <asp:LinkButton ID="LinkButtonClose" runat="server">[X Fechar]</asp:LinkButton>
      </td></tr></table>
      <table width="720px" cellpadding="0" cellspacing="0" align="center">
        <tr>
            <td width="30px" style="height: 35px"><asp:Image ID="lateralInt" runat="server" ImageUrl="~/images/h26.gif" /></td>
            <td width="690px" align="left"><br /><br /><br />
            
                <table border="0" width="690px" cellpadding="0" cellspacing="0">
                    <tr>
                        <td valign="top" width="135" height="131">
                            <asp:Image ID="ImageCandidato" runat="server" 
                                ImageUrl="~/images/candidato/cvnoImage.png" Width="120px" />
                            <br />
                                                <asp:Image ID="ImageDef" runat="server" ImageUrl="~/images/candidato/cv/deficienteT.gif" ImageAlign="Right" Visible="False" ToolTip="Pessoa com necessidades especiais." /></td>
                        <td width="465" valign="top"><asp:Image ID="Image2" runat="server" ImageUrl="~/images/candidato/cv/titdadospessoais.gif" /><br />
                            <table cellpadding="0" cellspacing="0" width="465">
                                <tr>
                                    <td width="26">
                                        <asp:Image ID="lateral" runat="server" ImageUrl="~/images/h26.gif" /></td>
                                    <td width="439">
                                        <asp:DataList ID="DataList1" runat="server" DataKeyField="idCadastroUser" DataSourceID="SqlDataSource1" Width="440px">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" CssClass="cur01st" Text="Nome:"></asp:Label>&nbsp;<br />
                                                <asp:Label ID="nomeLabel" runat="server" Text='<%# Eval("nome") %>' CssClass="cur01"></asp:Label><br />
                                                <asp:Label ID="Label2" runat="server" CssClass="cur01st" Text="Endereço: "></asp:Label>&nbsp;<br />
                                                <asp:Label ID="enderecoLabel" runat="server" Text='<%# Eval("endereco") %>' CssClass="cur01"></asp:Label>&nbsp;<br />
                                                <asp:Label ID="bairroLabel" runat="server" Text='<%# Eval("bairro") %>' CssClass="cur01"></asp:Label>
                                                -
                                                <asp:Label ID="cidadeLabel" runat="server" Text='<%# Eval("cidade") %>' CssClass="cur01"></asp:Label>
                                                /
                                                <asp:Label ID="ufLabel" runat="server" Text='<%# Eval("uf") %>' CssClass="cur01"></asp:Label>
                                                -
                                                <asp:Label ID="paisLabel" runat="server" Text='<%# Eval("pais") %>' CssClass="cur01"></asp:Label><br />
                                                <asp:Label ID="Label3" runat="server" CssClass="cur01st" Text="CEP: "></asp:Label>
                                                <asp:Label ID="cepLabel" runat="server" Text='<%# Eval("cep") %>' CssClass="cur01"></asp:Label>
                                                <br />
                                                <br />
                                                <asp:Label ID="Label52" runat="server" CssClass="cur01st" Text="e-mail:"></asp:Label>
                                                <asp:Label ID="Labelemailcandidato" runat="server" CssClass="cur01" 
                                                    Text='<%# Eval("email") %>'></asp:Label>
                                                <br />
                                                <br />
                                                <asp:Label ID="lblCabecContato" runat="server" CssClass="cur01st" 
                                                    Text="Forma de contato:"></asp:Label>
                                                <br />
                                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                                                    BorderStyle="None" DataKeyNames="idTipoTelefone" DataSourceID="SqlDataSource10" 
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
                                                                (<asp:Label ID="Label1" runat="server" Text='<%# Bind("ddd") %>'></asp:Label>
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
                                                <asp:Label ID="Label5" runat="server" CssClass="cur01st" 
                                                    Text="Data de nascimento:"></asp:Label>
                                                <asp:Label ID="nascimentoLabel" runat="server" CssClass="cur01" 
                                                    Text='<%# Eval("nascimento", "{0:d}") %>'></asp:Label>
                                                &nbsp;<br />
                                                <br />
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
                                        </asp:DataList><asp:DataList ID="DataListDef" runat="server" 
                                            DataSourceID="SqlDataSource2">
                                            <ItemTemplate>
                                                <asp:Label ID="dsDefFalaLabel" runat="server" CssClass="cur01" Text='<%# Eval("dsDefFala") %>'></asp:Label><br />
                                                <asp:Label ID="dsDefAuditivaLabel" runat="server" CssClass="cur01" Text='<%# Eval("dsDefAuditiva") %>'></asp:Label><br />
                                                <asp:Label ID="dsDefMentalLabel" runat="server" CssClass="cur01" Text='<%# Eval("dsDefMental") %>'></asp:Label><br />
                                                <asp:Label ID="dsDefMotoraLabel" runat="server" CssClass="cur01" Text='<%# Eval("dsDefMotora") %>'></asp:Label><br />
                                                <asp:Label ID="dsDefVisualLabel" runat="server" CssClass="cur01" Text='<%# Eval("dsDefVisual") %>'></asp:Label><br />
                                                <br />
                                                <asp:Label ID="ObsLabel" runat="server" CssClass="cur01" Text='<%# Eval("Obs") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderTemplate>
                                                <br />
                                                <asp:Image ID="Image2" runat="server" 
                                                    ImageUrl="~/images/candidato/cv/titdeficiencia.gif" />
                                            </HeaderTemplate>
                                        </asp:DataList><asp:Label ID="Label25" runat="server" Visible="False"></asp:Label>
                                        <asp:Label ID="Label31" runat="server" Visible="False"></asp:Label>
                                        <asp:Label ID="Label41" runat="server" Visible="False"></asp:Label>
                                        <asp:Label ID="Label42" runat="server" Visible="False"></asp:Label>
                                        <asp:Label ID="Label43" runat="server" Visible="False"></asp:Label>
                                        <asp:Label ID="Label44" runat="server" Visible="False"></asp:Label>
                                        <asp:Label ID="LabelDef" runat="server" Visible="False"></asp:Label>
                                        <asp:Label ID="idUserLabel" runat="server" Visible="False"></asp:Label>
                                        <asp:Label ID="idCurriculoLabel" runat="server" Visible="False"></asp:Label>
                                        <asp:Label ID="idpublicaLabel" runat="server" Visible="False"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
                
            </td> 
        </tr>
    </table> 
    <br />
    <br />
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
          ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
          SelectCommand="SELECT tbCadastroUser.idCadastroUser, tbCadastroUser.nome, tbCadastroUser.endereco, tbCadastroUser.cep, tbCadastroUser.bairro, tbCadastroUser.cidade, tbCadastroUser.uf, tbCadastroUser.pais, tbCadastroUser.nascimento, tbCadastroUser.sexo, tbCadastroUser.cadastroTipo, tbCadastroUser.apresentar, tbCadastroUser.estadocivil, tbCadastroUser.nrdependente, tbCadastroUser.portadorDef, tbCadastroUser.trabalhando, tbCadastroUser.resumo, tbCadastroUser.valorRemAtual, tbCadastroUser.valorRemPretendida, tbCadastroUser.localPreferencia, tbCadastroUser.disponibilidade, tbCadastroUser.origem, tbCadastroUser.data, tbuser.email FROM tbCadastroUser INNER JOIN tbuser ON tbCadastroUser.idUser = tbuser.idUser WHERE (tbCadastroUser.idUser = @idUser)">
        <SelectParameters>
            <asp:ControlParameter ControlID="idUserLabel" DefaultValue="0" Name="idUser" 
                PropertyName="Text" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        SelectCommand="SELECT [idUser], [dsDefFala], [dsDefAuditiva], [dsDefMental], [dsDefMotora], [dsDefVisual], [Obs] FROM [vwdeficienciafisica] WHERE ([idUser] = @idUser)">
        <SelectParameters>
            <asp:ControlParameter ControlID="idUserLabel" DefaultValue="0" Name="idUser" 
                PropertyName="Text" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        SelectCommand="SELECT [idcurriculo], [apresentacao], [realizacao], [resumogeral], [objetivo] FROM [tbCartaApresentacao] WHERE ([idcurriculo] = @idcurriculo)">
        <SelectParameters>
            <asp:ControlParameter ControlID="idCurriculoLabel" DefaultValue="0" 
                Name="idcurriculo" PropertyName="Text" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        SelectCommand="SELECT [idcurriculo], [dsCurso], [obs], [data_ini], [data_fim], [dsinstituicao], [estado], [uf], [dsTipo] FROM [vwformacaoacademica] WHERE ([idcurriculo] = @idcurriculo)">
        <SelectParameters>
            <asp:ControlParameter ControlID="idCurriculoLabel" DefaultValue="0" 
                Name="idcurriculo" PropertyName="Text" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        SelectCommand="SELECT [idcurriculo], [Instituicao], [dsCurso], [obsCurso], [data_ini], [data_fim], [concluido] FROM [tbCursoExtraCurricular] WHERE ([idcurriculo] = @idcurriculo)">
        <SelectParameters>
            <asp:ControlParameter ControlID="idCurriculoLabel" DefaultValue="0" 
                Name="idcurriculo" PropertyName="Text" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        SelectCommand="SELECT [idcurriculo], [dsTipoConhecimento], [dsGrauExperiencia], [dsTipoConhecimentoRel], [obs] FROM [vwconhecimentoInfo] WHERE ([idcurriculo] = @idcurriculo)">
        <SelectParameters>
            <asp:ControlParameter ControlID="idCurriculoLabel" DefaultValue="0" 
                Name="idcurriculo" PropertyName="Text" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        SelectCommand="SELECT [nomeempresa], [dsexperiencia], [data_ini], [data_fim], [dsAreaAtuacao], [dsRelacaoTrabalhista], [dsPorte], [idcurriculo] FROM [vwExperienciaProf] WHERE ([idcurriculo] = @idcurriculo) ORDER BY [data_ini] DESC, [data_fim] DESC">
        <SelectParameters>
            <asp:ControlParameter ControlID="idCurriculoLabel" DefaultValue="0" 
                Name="idcurriculo" PropertyName="Text" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        SelectCommand="SELECT [idcurriculo], [dsnivel], [dsidioma], [dscomentario] FROM [vwidioma] WHERE ([idcurriculo] = @idcurriculo)">
        <SelectParameters>
            <asp:ControlParameter ControlID="idCurriculoLabel" DefaultValue="0" 
                Name="idcurriculo" PropertyName="Text" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource9" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        SelectCommand="SELECT [idcurriculo], [pais], [dsIntercambio], [data_ini], [data_fim] FROM [tbintercambio] WHERE ([idcurriculo] = @idcurriculo) ORDER BY [data_ini] DESC, [data_fim] DESC">
        <SelectParameters>
            <asp:ControlParameter ControlID="idCurriculoLabel" DefaultValue="0" 
                Name="idcurriculo" PropertyName="Text" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource10" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        SelectCommand="SELECT tbTelefone.ddd, tbTelefone.numero, tbTelefone.ramal, tbTipoTelefone.idTipoTelefone, tbTelefone.idCadastroUser FROM tbTelefone INNER JOIN tbTipoTelefone ON tbTelefone.idTipoTelefone = tbTipoTelefone.idTipoTelefone WHERE (tbTelefone.idCadastroUser = @idCadastroUser)">
        <SelectParameters>
            <asp:ControlParameter ControlID="idCurriculoLabel" DefaultValue="0" 
                Name="idCadastroUser" PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>

                </asp:Panel>
                <asp:DragPanelExtender ID="PanelCV_DragPanelExtender" runat="server" 
                    DragHandleID="PanelCV" Enabled="True" TargetControlID="PanelCV">
                </asp:DragPanelExtender>
                <br />
                <asp:SqlDataSource ID="SqlDataCANDIDATURA" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                    SelectCommand="_USP_CANDIDATURA_CV_PRATA_CODIGO" 
                    SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="codigoLabel" Name="codigo" PropertyName="Text" 
                            Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataGrid" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        
        
        SelectCommand="SELECT [idVagaPublica], [idCadastroEmpresa], [idfuncao], [titVagaPublica], [dsVagaPublica], [email], [data], [validade], [codigo], [referencia], [publicar] FROM [tbVagaPublica] WHERE ([idCadastroEmpresa] = @idCadastroEmpresa) ">
        <SelectParameters>
            <asp:SessionParameter Name="idCadastroEmpresa" SessionField="idCadastroEmpresa" 
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
            </td>
            </tr>
    </table>
    <br />
</asp:Content>

