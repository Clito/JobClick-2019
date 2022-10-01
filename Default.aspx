<%@ Page Language="VB" MasterPageFile="MasterPageJobClick.master" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="Default2" title="" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>


<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
<style type="text/css">
    *   {
        margin: 0px;
        padding: 0px;
    }
        .popup {
        	position: absolute;
        	display: none;
        	z-index: 50;
        	border-collapse: collapse;
        }

        .popup td.corner {
        	height: 15px;
        	width: 19px;
        }

        .popup td#topleft { background-image: url(/images/layoutNew/bubble_popup/bubble-1.png); }
        .popup td.top { background-image: url(/images/layoutNew/bubble_popup/bubble-2.png); }
        .popup td#topright { background-image: url(/images/layoutNew/bubble_popup/bubble-3.png); }
        .popup td.left { background-image: url(/images/layoutNew/bubble_popup/bubble-4.png); }
        .popup td.right { background-image: url(/images/layoutNew/bubble_popup/bubble-5.png); }
        .popup td#bottomleft { background-image: url(/images/layoutNew/bubble_popup/bubble-6.png); }
        .popup td.bottom { background-image: url(/images/layoutNew/bubble_popup/bubble-7.png); text-align: center;}
        .popup td.bottom img { display: block; margin: 0 auto; }
        .popup td#bottomright { background-image: url(/images/layoutNew/bubble_popup/bubble-8.png); }

        .popup table.popup-contents {
        	font-size: 12px;
        	line-height: 1.2em;
        	background-color: #fff;
        	color: #666;
        	font-family: "Lucida Grande", "Lucida Sans Unicode", "Lucida Sans", sans-serif;
        	}

        table.popup-contents th {
        	text-align: right;
        	text-transform: lowercase;
        	}

        table.popup-contents td {
        	text-align: left;
        	}

    #menu .linkcandidato
    {
        color: #fff !important;
    }
        
</style>
    <script type="text/javascript">
        if ((typeof parent.jobclick_config) != "undefined") {
            window.location = "_anonimo/vagas.aspx";
        };
    </script>
<script type="text/javascript">
    function CreateSocialButtons() {
        $('div').each(function (index, domEle) {
            if ($(domEle).attr('id') == 'fblike') {

                var elem = $(document.createElement("div"));
                elem.attr("class", "fb-like");
                //elem.attr("data-href", "http://www.jobclick.com.br");
                elem.attr("data-send", "true");
                elem.attr("data-show-faces", "true");
                elem.attr("width", "350px");
                elem.attr("height", "100px");

                $(domEle).empty().append(elem);
            }

            if ($(domEle).attr('id') == 'g-plusone') {

                var elem = $(document.createElement("div"));
                elem.attr("class", "g-plusone");
                //elem.attr("data-href", "http://www.jobclick.com.br");
                elem.attr("data-size", "tall");
                elem.attr("data-annotation", "inline");
                elem.attr("width", "350px");
                elem.attr("height", "100px");

                $(domEle).empty().append(elem);
            }

            if ($(domEle).attr('id') == 'tweetbutton') {

                var strProtocolo = $(domEle).attr('data-strProtocolo');
                var strVaga = $(domEle).attr('data-strVaga');

                var elem = $(document.createElement("a"));
                elem.attr("class", "twitter-share-button");
                elem.attr("href", "https://twitter.com/share");
                //elem.attr("data-url", "http://www.jobclick.com.br");
                elem.attr("data-text", "Recomendo o JobClick. O primeiro buscador de vagas de empregos do Brasil");
                elem.attr("data-lang", "pt");
                elem.attr("data-size", "large");
                elem.attr("height", "100px");

                $(domEle).empty().append(elem);
            }
        });

        FB.XFBML.parse();
        gapi.plusone.go();

    }


    $(function () {
        $('.bubbleInfo').each(function () {
            var distance = 10;
            var time = 250;
            var hideDelay = 5000;

            var hideDelayTimer = null;

            var beingShown = false;
            var shown = false;
            var trigger = $('.trigger', this);
            var info = $('.popup', this).css('opacity', 0);

            $([trigger.get(0), info.get(0)]).click(function () {
                if (hideDelayTimer) clearTimeout(hideDelayTimer);
                if (beingShown || shown) {
                    // don't trigger the animation again
                    return;
                } else {
                    // reset position of info box
                    var position = $("input[type=text]").position();
                    beingShown = true;

                    info.css({
                        top: position.top - 34,
                        left: position.left - 150,
                        display: 'block'
                    }).animate({
                        top: '-=' + distance + 'px',
                        opacity: 1
                    }, time, 'swing', function () {
                        beingShown = false;
                        shown = true;
                    });
                }

                return false;
            }).mouseout(function () {
                if (hideDelayTimer) clearTimeout(hideDelayTimer);
                hideDelayTimer = setTimeout(function () {
                    hideDelayTimer = null;
                    info.animate({
                        top: '-=' + distance + 'px',
                        opacity: 0
                    }, time, 'swing', function () {
                        shown = false;
                        info.css('display', 'none');
                    });

                }, hideDelay);

                return false;
            });
        });
    });
</script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <br />
    <br />
    <br />
    <br />
    <div>
    <div id="LogoPosition" class="new_LogoPosition">
        <a href="/comercial/ged.aspx" title="GED - Gestão Eletrônica de Documentos da JobClick - A Digitalização dinamiza extraordinariamente o acesso e a disseminação das informações entre os funcionários e colaboradores." style="background-image:url(/images/layoutNew/logoJobClick.png);display:block;height:163px;text-indent:-9999px;width:475px;"></a>
    </div>
    </div>
    <asp:Panel ID="PesquisaPNL" runat="server" DefaultButton="ImageButtonPSQ">
        <div class="bubbleInfo">
            <table id="Pesquisa" class="new_PesquisaPosition">
                <tr>
                    <td style="text-align:center" class="trigger">
                        <asp:TextBox ID="TextBoxPsq" runat="server" CssClass="login" style="text-align: center;"></asp:TextBox>
                        <cc1:TextBoxWatermarkExtender ID="TextBoxPsq_TextBoxWatermarkExtender" 
                            runat="server" Enabled="True" TargetControlID="TextBoxPsq" 
                            WatermarkText="Digite o nome da oportunidade, localização e/ou código.">
                        </cc1:TextBoxWatermarkExtender>
                        <br />
                        <br />
                    </td>
                    <td>
                        <table id="dpop" class="popup" style="left: -33px; top: -110px; opacity: 0; display: none; margin: 0px; padding: 0px">
                            <tbody>
                                <tr>
                                    <td id="topleft" class="corner"></td>
                                    <td class="top"></td>
                                    <td id="topright" class="corner"></td>
                                </tr>

                                <tr>
                                    <td class="left"></td>
                                    <td><table class="popup-contents">
        	                            <tbody><tr>
        		                            <td><asp:Label ID="LabelPsq" runat="server" Text="Exemplo: <b>Analista de Sistemas Belo Horizonte</b>"></asp:Label></td>
        	                            </tr>
                                    </tbody></table>

                                    </td>
                                    <td class="right"></td>    
                                </tr>

                                <tr>
                                    <td class="corner" id="bottomleft"></td>
                                    <td class="bottom"><img width="30" height="29" alt="popup tail" src="/images/layoutNew/bubble_popup/bubble-tail2.png" /></td>
                                    <td id="bottomright" class="corner"></td>
                                </tr>
                            </tbody>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
        <div>
            <table id="Pesquisar" style="text-align: center; margin: auto">
                <tr>
                    <td>
                        <asp:ImageButton ID="ImageButtonPSQ" runat="server" 
                            ImageUrl="~/images/layoutNew/btPesquisaGeral.png" TabIndex="1" style="display:none" AlternateText="Pesquisa Geral" /><asp:LinkButton
                                ID="LinkButton_PSQ" runat="server" CssClass="button">Pesquisar</asp:LinkButton>
                        &nbsp;<!--a href="/_anonimo/vagas.aspx"><img id="btPesquisaTodas" name="btPesquisaTodas" alt="" src="../images/layoutNew/bttodas.png" style="border-width:0px;" /></a-->
                        <asp:LinkButton ID="LinkButton_PesquisaTodas" runat="server" PostBackUrl="~/_anonimo/sponsoredAD.aspx" CssClass="button">Todas</asp:LinkButton>
                    </td>
                </tr>
            </table>
        </div>

	    <div id="rodape" style="text-align: center; height:100px; overflow:inherit"> 
		    <div id="fblike" style="float:left; text-align: center; width:350px; height:100px">
		    </div>
		    <div id="g-plusone" style="float:left; text-align: center; width:350px; margin-left: 10px; height:100px">
		    </div>
		    <div id="tweetbutton" style="float:left; margin-left: 10px; height:100px">
		    </div>	
	    </div>
	


	    <script>
	
		    function CenterSocial() {
			    $('#rodape').css("position", "absolute");
			    $('#rodape').css("top", ($('#Pesquisa tr td').position().top * 2) + "px");
			    $('#rodape').css("left", $('#Pesquisa tr td').position().left + "px");
		    };
		
		    CenterSocial();
		
		    $(window).resize(function() {
			    CenterSocial();
		    });
		
		    CreateSocialButtons();		
	    </script>
	</asp:Panel>
</asp:Content>

