<%@ Page Language="VB" MaintainScrollPositionOnPostback="false" MasterPageFile="~/MasterPageJobClick.master" AutoEventWireup="false" CodeFile="vagas.aspx.vb" Inherits="Vagas" title="Oportunidades" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">

        .vaga a:link { text-decoration: none; color: #1122cc}
        .vaga a:hover { text-decoration: underline; color: #1122cc}
        .vaga a:active { text-decoration: none; color: #d14836 }
        .vaga a:visited { text-decoration: none; color: #6643e6 }

        .style1
        {
            color: #999999;
        }

        .style2
        {
            height: 20px;
        }
        .style3
        {
            height: 16px;
        }
   
        .OpenClose 
        {
        
        }
    
        .DivStyle
        {
        
        }
        
        .ulli:hover
        {
            background-color: #FAFAFA;
        }
    
    ul {
            list-style-type: none;
            padding: 0px;
            margin: 0px;
       }
    #hr { 
        margin: 0; 
        padding: 0; 
        width: 100%; 
        height: 1px; 
        background-color: #000; 
    }
    
    #menu .linkcandidato
    {
        color: #fff !important;
    }
    </style>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1 style="display:none">Painel de Vagas</h1>
     <script type="text/javascript">
         userLogado = '<%=UserLogado()%>';
         idUser = '<%=Session("idUser")%>';
         if ((GEO_Estado != null) && ('<%=DropDownList_Estado.SelectedValue%>' == 'GEO')) {
             Estado = GEO_Estado
             $(document).ready(function () {
                 $('#<%=DropDownList_Estado.ClientID%>').find('option[value="' + GEO_Estado + '"]').attr('selected',true);
             })
         }
         else if ($('#Painel_Jobclick', parent.document).length > 0) {
             if ('<%=DropDownList_Estado.SelectedValue%>' == 'GEO') {
                 Estado = '';
                 $(document).ready(function () {
                     $('#<%=DropDownList_Estado.ClientID%>').find('option[value=""]').attr('selected', true);
                 })
             }
             else if (Estado == "") {
                 Estado = '<%=DropDownList_Estado.SelectedValue%>'
             }
         }
         else {
             Estado = '<%=DropDownList_Estado.SelectedValue%>'
             if (Estado == 'GEO') {
                 Estado = '';
                 $(document).ready(function () {
                     $('#<%=DropDownList_Estado.ClientID%>').find('option[value=""]').attr('selected', true);
                 })
             }
         };
         PNE = '<%=CheckBox_PNE.Checked%>'
    </script>
    <script src="vagas.aspx.js" type="text/javascript"></script>
<!-- ******************************************************************** /Pesquisa ************************************************************************ -->
    <asp:Panel ID="panelPesquisa" runat="server" DefaultButton="btPesquisaGeral">
    <!--form id="formPesquisa" name="formPesquisa" method="get" action="#"-->
	<input type="hidden" id="landing_more" onclick="More();" />
    <div>
       <div style="text-align: left">
        <table style="text-align: left; padding: 0px; margin: 0px; width: 100%;" id="TopHOME">
            <tr>
                <td style="text-align: center; width: 100px">
                   <div id="logoDiv"><a href="/"><img alt="" id="logoParceiroEmpresa" style="border: 0px" src="/images/layoutNew/logoloading.gif" /></a></div>
			    </td>
			    <td>
				    <table style="padding: 0px; margin: 0px; text-align:left;">
					    <tr>
						    <td style="text-align: left; vertical-align: top;">
							    <table style="padding: 0px; margin: 0px; width: 720px; border: 0">
								    <tr>
									    <td>
										    <table style="padding: 0px 10px; margin: 0px; width: 100%" id="Pesquisa">
											    <tr>
												    <td>
													    <span>Digite o nome da oportunidade, localização e/ou código<br />Exemplo: <b>Analista de Sistemas Belo Horizonte</b></span>&nbsp;<br />
													    <table style="padding: 0px; margin: 0px; width: 100%;">
														    <tr>
															    <td>
																    <input type="text" id="pesquisa" name="pesquisa" value="<% Response.write(PesquisaTerm()) %>" class="login" style="width:450px;" />
															    </td>
															    <td>
                                                                    <asp:LinkButton ID="LinkButton_btPesquisaGeral" runat="server" class="button">Pesquisar</asp:LinkButton>
																    <asp:imagebutton id="btPesquisaGeral" style="border-width:0px; display:none" runat="server" AlternateText="Pesquisar" ImageUrl="~/images/layoutNew/btPesquisaGeral.png" />
                                                                    &nbsp;<a onclick="javascript:$('#DIV_PesquisaAvancada').slideToggle()" style="cursor: pointer"> [+] Avançada</a>
															    </td>
														    </tr>
                                                            <tr>
                                                                <td class="behind_searchbox">
                                                                    <span>Estado: </span>
                                                                    <div class="behind_searchbox_combo">
                                                                        <asp:DropDownList ID="DropDownList_Estado" runat="server" AppendDataBoundItems="True" 
                                                                            DataSourceID="SqlDataSourceEstado" DataTextField="dsuf" DataValueField="uf" CssClass="DropDownList_Estado">
                                                                            <asp:ListItem Value="GEO">Minha Localização Atual</asp:ListItem>
                                                                            <asp:ListItem Value="">-- Todos --</asp:ListItem>
                                                                        </asp:DropDownList>
                                                                        <asp:SqlDataSource ID="SqlDataSourceEstado" runat="server" 
                                                                            ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                                                                
                                                                            SelectCommand="SELECT [uf], [dsuf] FROM [tbuf] WHERE isnull(uf, '') &lt;&gt; ''"></asp:SqlDataSource>
                                                                    </div>
                                                                </td>
                                                            </tr>
													    </table>
												    </td>
											    </tr>
										    </table>
								       </td>
								    </tr>
                                    <tr>
                                        <td>
                                            <div id="DIV_PesquisaAvancada" style="display:none">
                                                <table>
                                                    <tr style="vertical-align: middle">
                                                        <td style="margin: 0; padding: 0 0 0 15px;" >
                                                            <asp:CheckBox ID="CheckBox_PNE" runat="server" Checked="False"/> 
                                                        </td>
                                                        <td style="margin: 0; padding: 0;" >
                                                            <img src="../images/candidato/cv/deficienteT.png" alt="" /> 
                                                        </td>
                                                        <td style="margin: 0; padding: 0;" >
                                                            Portador de Necessidades Especiais (PNE)
                                                        </td>
                                                    </tr>
                                                </table>
                                                <br />
                                              </div>
                                        </td>
                                    </tr>
						       </table>
						    </td>
					    </tr>
				    </table>
			    </td>
                <td>
                    <div id="logoPartner" style="display: none">
                        <a href="javascript:parent.redirect('jobclick');"><img alt="" style="border: 0px" src="/images/layoutNew/jobclick_partner.png" /></a>
                    </div>
                </td>
		    </tr>
	    </table>
        </div>
        <hr />&nbsp;
        <div id="vaga" class="vaga">
            <table style="width: 100%">
                <tr>
                    <td style="width: 100px">
                    </td>
                    <td style="text-align:left;">
                        <input id="switch" name="switch" type="hidden" value="false" />
                        <input id="LAST_OrderID" name="LAST_OrderID" type="hidden" value="0" />
                        <ul id="dispVaga">
                        </ul>
                        <a onclick="javascript:More();" style="cursor: pointer" id="moreButton">
                            <table style="border:0px; padding: 0px; margin:0px; height: 50px; color: #3f9bd9; width:100%" >
                                <tr style="background-color: Black">
                                    <td style="text-align: center; background-color: #EEEEEE" id="moreText">
                                        <img src='../images/loading.gif' alt="" />
                                        Carregando Oportunidades...
                                    </td>
                                </tr>
                            </table>
                        </a>
                    </td>
                    <td style="width: 100px">
                    </td>
                </tr>            
            </table>
        </div>
    </div>
    <!-- /form -->
<!-- ************************************************************************* /Pesquisa ************************************************************************* -->


<!-- ************************************************************************* Envia Email Amigo ************************************************************************* -->
<!--a id="IndicaAmigo" class="OpenClose" onclick="$('div').siblings('.DGINDICAPosition').toggle(500, function () { $('.DGINDICAPosition').center()} ); OnSendingWindow('');"></a-->
<a id="IndicaAmigo" class="OpenClose" onclick="$('div').siblings('.DGINDICAPosition').toggle(500); OnSendingWindow('');"></a>

        <asp:Panel ID="EmailAmigo" runat="server" CssClass="DGINDICAPosition" ClientIDMode="AutoID">

        <!-- form id="IndicaEmailAmigoForm" action="" -->
        <table style="border: 0px; padding: 0px; margin: 0px; width: 100%">
            <tr style="background-color: #929292">
                <td>
                    <span style="font-size:x-small; color: #FFFFFF; font-weight:bold">&nbsp;&nbsp;Indicação de Amigos </span>
                    <img id="closeInd" alt="" style="float: right; border-width:0px; cursor: pointer;" onclick="$('#IndicaAmigo').click()"
                        src="../images/layout/menuVagasClose.gif" />
                </td>
            </tr>
            <tr>
                <td style="text-align: left">
                    <table id="formAmigo" style="padding: 10px; margin: 4px; width: 100%">
                        <tr>
                            <td>
                                Indicação da oportunidade: <br /> 
                                <input type="hidden" id="idVaga" value="" />
                                <span id="strCodigo"> </span> - <span id="strVaga"> </span>
                                <br />
                                <br />
                                Seu Nome:<em>*</em>
                                <br />
                                <input type="text" id="nomeTextBox" class="InputCad validate[required]" />
                                <br />
                                Seu e-mail:<em>*</em>
                                <br />
                                <input type="text" id="emailTextBox" class="InputCad validate[required, custom[email]]" />
                                <br />
                                <br />
                                <br />
                                Nome de seu amigo:<em>*</em>
                                <br />
                                <input type="text" id="inomeTextBox" class="InputCad validate[required]" />
                                <br />
                                E-mail de seu amigo:<em>*</em>
                                <br />
                                <input type="text" id="iemailTextBox" class="InputCad validate[required, custom[email]]" />
                                <br />
                                Aproveite e diga um olá...<br />
                                <textarea rows="5" cols="5" id="mensagem" style="height: 60px;" class="InputCad validate[required]"></textarea>
                                <br />
                                <br />
                                <table style="padding: 0px; margin: 0px; width: 100%;">
                                    <tr>
                                        <td style="text-align: center">
                                            <a onclick="javascript:fnEnviaEmailAmigo();" class="button">Enviar essa vaga para seu amigo</a>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                    <table id="formAmigoEnviado" style="padding: 10px; margin:10px; width: 100%; display: none;">
                        <tr>
                            <td style="text-align: center">
                                Sua indicação foi enviada com sucesso! <br />
                                <img id="Img2" src="../images/layoutNew/emailEnviado.png" alt="" /> <br />
                                <a style="cursor: pointer;" onclick="OnSendingWindow('');">Voltar</a>
                            </td>
                        </tr>
                    </table> 
                    <table id="formAmigoErro" style="padding: 10px; margin:10px; width: 100%; display: none;">
                        <tr>
                            <td style="text-align: center">
                                Falha ao enviar sua indicação. Verifique se o e-mail existe! <br />
                                <img id="ImageButtonAviso" src="../images/layoutNew/emailNaoEnviado.png" alt="" /> <br />
                                <a style="cursor: pointer;" onclick="OnSendingWindow('');">Voltar</a>
                            </td>
                        </tr>
                    </table> 
                    <table id="formAmigoEnviando" style="padding: 10px; margin:10px; width: 100%; display: none;">
                        <tr>
                            <td style="text-align: center">
                                 <img src='../images/loading.gif' alt="" /> Enviando...    
                            </td>
                        </tr>
                    </table> 
                </td>
            </tr>
        </table>  
        <!--/form -->       
        </asp:Panel>
        
<!-- ************************************************************************* /Envia Email Amigo ************************************************************************* -->


<!-- ************************************************************************* Candidatar-se ************************************************************************* -->
<!--a id="CandidatarSe" class="OpenClose" onclick="$('div').siblings('.DGCandidatarsePosition').toggle(500, function () { $('.DGCandidatarsePosition').center()} ); OnCandidatarWindow(''); CheckCandidatura();"></a-->
<a id="CandidatarSe" class="OpenClose" onclick="$('div').siblings('.DGCandidatarsePosition').toggle(500); OnCandidatarWindow(''); CheckCandidatura();"></a>

        <asp:Panel ID="candidatarse_Panel" runat="server" CssClass="DGCandidatarsePosition" ClientIDMode="AutoID">

        <!-- form id="CandidatarForm" action="" -->
        <table style="border: 0; padding:0px; margin: 0px; width: 100%">
            <tr style="background-color: #929292">
                <td>
                    <span style="font-size:x-small; color: #FFFFFF; font-weight:bold">&nbsp;&nbsp;Candidatar-se </span>
                    <img id="Img1" alt="" style="float:right; border-width:0px; cursor: pointer;" onclick="$('#CandidatarSe').click()"
                        src="../images/layout/menuVagasClose.gif" />
                </td>
            </tr>
            <tr style="background-color: #ffffe8">
                <td  style="text-align: left">
                    <table id="formCandidatarLogin" style="padding: 10px; margin: 5px; width: 100%; display: none;">
                        <tr>
                            <td  style="text-align: center">
                                Para candidatar-se é necessário estar logado <br />
                                <a onclick="javascript:window.location = '/_candidato/vagas.aspx?pesquisa=' + $('#CodigoVagaCandidato').text();" style="border-width:0px; cursor: pointer;">
                                    Clique aqui para fazer o Login<br /><img src="../images/layoutNew/btlogin.png" alt="" style="border-width:0px;"/></a>
                                <br />
                                <a onclick="javascript:window.location = '/_anonimo/cadastroCandidato.aspx';" style="border-width:0px; cursor: pointer;">
                                    ou clique aqui para se cadastrar gratuitamente
                                </a>
                            </td>
                        </tr>
                    </table> 
                    <table id="formCandidatar" style="padding: 10px; margin:10px; width: 100%; display: none;">
                        <tr>
                            <td>
                                Candidatura para a oportunidade: <br /> 
                                <input type="hidden" id="idVagaCandidato" value="" />
                                <input type="hidden" id="idTipoVagaCandidato" value="" />
                                <span id="CodigoVagaCandidato"> </span> - <span id="NomeVagaCandidato"> </span>
                                <br />
                                <br />
                                Selecione o curriculo:<em>*</em>
                                <br />
                                <span id="SelectCurriculo"></span>
                                <!--br />
                                Escreva uma apresentação para o recrutador: <br /-->
                                <textarea rows="5" cols="5" id="MensagemApresentacaoCandidato" style="height: 10px; visibility: hidden" class="InputCad validate[required]" ></textarea>
                                <!--br /-->
                                <span style="font-size: 7pt; font-weight: bold"> Atenção: Ao utilizar um curriculo "Não disponível para Recrutadores" o status é alterado automaticamente para "Disponível para Recrutadores" </span>
                                <table style="padding: 0px; margin: 0px; width: 100%;">
                                    <tr>
                                        <td style="text-align: center">
                                            <br />
                                            <a onclick="fnCandidatar();" class="button">Candidatar-se a essa oportunidade</a>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                    <table id="formCandidatarEnviado" style="padding: 10px; margin:10px; width: 100%; display: none;">
                        <tr>
                            <td style="text-align: center">
                                Sua candidatura foi enviada com sucesso! <br />
                                <img id="Img4" src="../images/layoutNew/emailEnviado.png" alt="" />
                            </td>
                        </tr>
                    </table> 
                    <table id="formCandidatarErro" style="padding: 10px; margin:10px; width: 100%; display: none;">
                        <tr>
                            <td style="text-align: center">
                                Falha ao enviar sua candidatura. <br />
                                Por favor entre em contato com <a id="mailtoerrocandidatura" href="" onclick="javascript:$get('mailtoerrocandidatura').href = 'mailto:helpdesk@jobclick.com.br?subject=Erro na Candidatura - ' + $('#CodigoVagaCandidato').text() + ' - ' + $('#SelectedCurriculo').val();">helpdesk@jobclick.com.br</a> infomando o seu login e código da oportunidade!<br />
                                <img id="Img5" src="../images/layoutNew/emailNaoEnviado.png" alt="" /> <br />
                                <a style="cursor: pointer;" onclick="OnCandidatarWindow('');">Voltar</a>
                            </td>
                        </tr>
                    </table> 
                    <table id="formCandidatarEnviando" style="padding: 10px; margin:10px; width: 100%; display: none;">
                        <tr>
                            <td style="text-align: center">
                                 <img src='../images/loading.gif' alt="" /> Enviando...    
                            </td>
                        </tr>
                    </table>
                    <table id="formCandidatarCheck" style="padding: 10px; margin: 10px; width: 100%; ">
                        <tr>
                            <td style="text-align: center">
                                 <img src='../images/loading.gif' alt="" /> Checando Candidatura...    
                            </td>
                        </tr>
                    </table> 
                    <table id="formCandidatarPaga" style="padding: 10px; margin: 10px; width: 100%; display: none;">
                        <tr>
                            <td style="text-align: center"> 
                                Olá, para prosseguir você precisa adquirir ou renovar a sua assinatura, para adquirir ou renovar 
                                <a onclick="javascript:window.location = '/_candidato/_creditocandidato.aspx';" style="border-width:0px; cursor: pointer;">
                                    [clique aqui]
                                </a>.
                            </td>
                        </tr>
                    </table> 
                    <table id="formCandidatarCandidatou" style="padding: 10px; margin:10px; width: 100%; display: none;">
                        <tr>
                            <td style="text-align: center">
                                Você já se candidatou a esta oportunidade.<br />Aguarde uma posição da empresa.
                                <img id="Img6" src="../images/layoutNew/relogio.png" alt="" />
                            </td>
                        </tr>
                    </table> 
                </td>
            </tr>
        </table>  
        <!--/form-->       
                  
        </asp:Panel>

<!-- ************************************************************************* /Candidatar-se ************************************************************************* -->
</asp:Panel>
</asp:Content>
