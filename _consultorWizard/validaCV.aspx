﻿<%@ Page Language="VB" MasterPageFile="~/_consultorWizard/ConsultorMasterPage.master" AutoEventWireup="false" CodeFile="validaCV.aspx.vb" Inherits="_empresa__processo_validaCV" title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Image ID="cabec" runat="server" 
        ImageUrl="~/images/layout/e_processoAvaliacao.gif" />
        <table width="640" cellpadding="0" cellspacing="0">
        <tr>
            <td width="26">
                <asp:Image ID="lateral" runat="server" ImageUrl="~/images/h26.gif" />
            </td>
            <td width="614">
                <asp:Label ID="idCadastroUserLabel" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="idProcessoLabel" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="idUserLabel" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="idvagaLabel" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="idcurriculoLabel" runat="server" Visible="False"></asp:Label>
                <asp:LinkButton ID="LBVoltar" runat="server">Processo Seletivo</asp:LinkButton>
                
<asp:Panel ID="PanelcurriculoView" runat="server">
<table runat="server" id="ComandoButton" width="615" cellpadding="0" 
        cellspacing="0" visible="True">
        <tr>
            <td width="615" align="right">
                <asp:ImageButton ID="IBIncluir" runat="server" 
                    ImageUrl="~/images/empresa/incluiPS.gif" />
                &nbsp;
                <asp:ImageButton ID="IBFechar" runat="server" 
                    ImageUrl="~/images/empresa/fecharPS.gif" />
            </td> 
        </tr>
</table>  
                    <br />           
<table id="curriculoView" width="626" cellpadding="0" cellspacing="0">
        <tr>
            <td width="16">&nbsp;</td>
            <td width="600">
            
                <table border="0" width="600" cellpadding="0" cellspacing="0">
                    <tr>
                        <td class="bgimageEmpresa" valign="top" width="135" height="131"><asp:Label ID="lblFoto" runat="server"></asp:Label>
                            <br />
                                                <asp:Image ID="ImageDef" runat="server" ImageUrl="~/images/candidato/cv/deficienteT.gif" ImageAlign="Right" Visible="False" ToolTip="Pessoa com necessidades especiais." /></td>
                        <td width="465" valign="top"><asp:Image ID="Image9" runat="server" ImageUrl="~/images/candidato/cv/titdadospessoais.gif" /><br />
                            <table cellpadding="0" cellspacing="0" width="465">
                                <tr>
                                    <td width="26">
                                        <asp:Image ID="Image10" runat="server" ImageUrl="~/images/h26.gif" /></td>
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
                                        </asp:DataList><asp:Label ID="Label25" runat="server" Visible="False"></asp:Label>
                                        <asp:Label ID="Label31" runat="server" Visible="False"></asp:Label>
                                        <asp:Label ID="Label41" runat="server" Visible="False"></asp:Label>
                                        <asp:Label ID="Label42" runat="server" Visible="False"></asp:Label>
                                        <asp:Label ID="Label43" runat="server" Visible="False"></asp:Label>
                                        <asp:Label ID="Label44" runat="server" Visible="False"></asp:Label>
                                        <asp:Label ID="Label1" runat="server" Visible="False"></asp:Label>
                                        <br />
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
                    <asp:Label ID="MultimidiaLabel" runat="server"></asp:Label>
                    <br />
                    <br />
         
                </asp:Panel>                
                
            </td> 
         </tr>
         </table>    
           <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>" SelectCommand="SELECT [idCadastroUser], [nome], [endereco], [cep], [bairro], [cidade], [uf], [pais], [nascimento], [sexo], [cadastroTipo], [apresentar], [estadocivil], [nrdependente], [portadorDef], [trabalhando], [resumo], [valorRemAtual], [valorRemPretendida], [localPreferencia], [disponibilidade], [origem], [data] FROM [tbCadastroUser] WHERE ([idUser] = @idUser)">
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
            <asp:ControlParameter ControlID="idcurriculoLabel" DefaultValue="0" 
                Name="idcurriculo" PropertyName="Text" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        SelectCommand="SELECT [idcurriculo], [dsCurso], [obs], [data_ini], [data_fim], [dsinstituicao], [estado], [uf], [dsTipo] FROM [vwformacaoacademica] WHERE ([idcurriculo] = @idcurriculo)">
        <SelectParameters>
            <asp:ControlParameter ControlID="idcurriculoLabel" DefaultValue="0" 
                Name="idcurriculo" PropertyName="Text" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        SelectCommand="SELECT [idcurriculo], [Instituicao], [dsCurso], [obsCurso], [data_ini], [data_fim], [concluido] FROM [tbCursoExtraCurricular] WHERE ([idcurriculo] = @idcurriculo)">
        <SelectParameters>
            <asp:ControlParameter ControlID="idcurriculoLabel" DefaultValue="0" 
                Name="idcurriculo" PropertyName="Text" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        SelectCommand="SELECT [idcurriculo], [dsTipoConhecimento], [dsGrauExperiencia], [dsTipoConhecimentoRel], [obs] FROM [vwconhecimentoInfo] WHERE ([idcurriculo] = @idcurriculo)">
        <SelectParameters>
            <asp:ControlParameter ControlID="idcurriculoLabel" DefaultValue="0" 
                Name="idcurriculo" PropertyName="Text" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        SelectCommand="SELECT [nomeempresa], [dsexperiencia], [data_ini], [data_fim], [dsAreaAtuacao], [dsRelacaoTrabalhista], [dsPorte], [idcurriculo] FROM [vwExperienciaProf] WHERE ([idcurriculo] = @idcurriculo) ORDER BY [data_ini] DESC, [data_fim] DESC">
        <SelectParameters>
            <asp:ControlParameter ControlID="idcurriculoLabel" DefaultValue="0" 
                Name="idcurriculo" PropertyName="Text" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        SelectCommand="SELECT [idcurriculo], [dsnivel], [dsidioma], [dscomentario] FROM [vwidioma] WHERE ([idcurriculo] = @idcurriculo)">
        <SelectParameters>
            <asp:ControlParameter ControlID="idcurriculoLabel" DefaultValue="0" 
                Name="idcurriculo" PropertyName="Text" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource9" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        SelectCommand="SELECT [idcurriculo], [pais], [dsIntercambio], [data_ini], [data_fim] FROM [tbintercambio] WHERE ([idcurriculo] = @idcurriculo) ORDER BY [data_ini] DESC, [data_fim] DESC">
        <SelectParameters>
            <asp:ControlParameter ControlID="idcurriculoLabel" DefaultValue="0" 
                Name="idcurriculo" PropertyName="Text" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
&nbsp;
</asp:Content>

