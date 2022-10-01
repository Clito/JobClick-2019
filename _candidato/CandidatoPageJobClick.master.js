/// <reference path="~/jquery-1.7.min.js" />

function getInternetExplorerVersion()
// Returns the version of Internet Explorer or a -1
// (indicating the use of another browser).
{
    var rv = -1; // Return value assumes failure.
    if (navigator.appName == 'Microsoft Internet Explorer') {
        var ua = navigator.userAgent;
        var re = new RegExp("MSIE ([0-9]{1,}[\.0-9]{0,})");
        if (re.exec(ua) != null)
            rv = parseFloat(RegExp.$1);
    }
    return rv;
}
function checkVersion() {
    var msg = "You're not using Internet Explorer.";
    var ver = getInternetExplorerVersion();

    if (ver > -1) {
        if (ver <= 7.0)
            console.log("Navegador Desatualizado");
            // window.location = "/errobrowser.aspx";
    }
}

// checkVersion();

// ----------------------------------- /IFrame --------------------------------------

$(document).ready(function () {
    jQuery.fn.center = function () {
        this.css("position", "absolute");
        var top = (($(window).height() - this.outerHeight()) / 2) + $(window).scrollTop();
        var left = (($(window).width() - this.outerWidth()) / 2) + $(window).scrollLeft();

        if ($('#Painel_Jobclick', parent.document).length > 0) {
            top = (($(parent.window).height() - this.outerHeight()) / 2) + $(parent.window).scrollTop() - $('#Painel_Jobclick', parent.document).find('iframe').position().top;
            left = (($(parent.window).width() - this.outerWidth()) / 2) + $(parent.window).scrollLeft() - $('#Painel_Jobclick', parent.document).find('iframe').position().left;
        };

        if (top < 0) { top = 0 };

        this.css("top", top + "px");
        this.css("left", left + "px");
        return this;
    };
});

var partner = true;
var menu = "superior";
var idParceiro = 0;
var idEmpresa = 0;
var Cidade = "";
var Estado = "";
var Logo = true;
var css = "red";

if ((typeof parent.jobclick_config) != "undefined") {
    partner = parent.jobclick_config['partner'];
    menu = parent.jobclick_config['menu'];
    idParceiro = parent.jobclick_config['idparceiro'];
    idEmpresa = parent.jobclick_config['idempresa'];
    Cidade = parent.jobclick_config['cidade'];
    Estado = parent.jobclick_config['estado'];
    Logo = parent.jobclick_config['logo'];
    css = parent.jobclick_config['css'];

    // ---------------------------------- Redimensionamento do Iframe -------------------
    $('#Painel_Jobclick', parent.document).find('iframe').height(100);

    (function (previousInnerHTML) {
        return function () {
            if (document.body.innerHTML !== previousInnerHTML) {
                $('#Painel_Jobclick', parent.document).find('iframe').height($(document.body).height());
                $('#Painel_Jobclick', parent.document).height($(document.body).height());
                parent.jobclick_config['jobclick_height'] = $(document.body).height();
            }
            setTimeout(arguments.callee, 33);
        };
    })(document.body.innerHTML)();
    // ---------------------------------- Redimensionamento do Iframe -------------------

    $(document).ready(function () {
        if (idParceiro != 0) {
            $('#logoPartner').show();
        }

        if (idParceiro != 0 || idEmpresa != 0) {
            $('.LoginPanel').center();
            $('.LoginPanel').css('top', '0');
            $('.LembretePanel').center();
            $('.LembretePanel').css('top', '0');
        }

        /*if (menu != "superior") {
        $('#Nav').hide();
        }*/

        $(".button").addClass(css);
        $("#menu").addClass(css);
    });

    // ------------------------------- Logo Parceiro/Empresa -----------------------------
    $(document).ready(function () {
        idParceiroEmpresa = 0;


        if (Logo != true) {
            $('#logoDiv').hide();
        };

        if (idEmpresa != 0) {
            idParceiroEmpresa = idEmpresa;
        } else if (idParceiro != 0) {
            idParceiroEmpresa = idParceiro;
        };

        $.getJSON(
                        "/services/LogoParceiroEmpresa.aspx"
                        , {
                            "idParceiroEmpresa": idParceiroEmpresa
                        }
                        , "")
                        .success(function (data) {
                            if (data.ResultStatus == true) {
                                if (data.ResultSet_Logo !== "") {
                                    $('#logoParceiroEmpresa').attr('src', data.ResultSet_Logo);
                                } else {
                                    $('#logoParceiroEmpresa').attr('src', '/images/layoutNew/jobclick_corner.png');
                                }
                                if (data.ResultSet_BGTitulo !== "") {
                                    $('.TituloBG').css('background-image', 'url( ' + data.ResultSet_BGTitulo + ' )');
                                } else {
                                    $('.TituloBG').css('background-image', 'url( /images/layoutNew/bgTituloGeral.png )');
                                }
                            }
                            else {
                                console.log(data.ResultStatus_ErrorMessage);
                                $('#logoParceiroEmpresa').attr('src', '/images/layoutNew/jobclick_corner.png');
                                $('.TituloBG').css('background-image', 'url( /images/layoutNew/bgTituloGeral.png )');
                            }
                        })
                        .error(function () {
                            console.log('Pagina/Serviço LogoParceiroEmpresa não encontrada');
                        });

    });
} else {
    $(document).ready(function () {
        $('#logoParceiroEmpresa').attr('src', '/images/layoutNew/jobclick_corner.png');
        $('.TituloBG').css('background-image', 'url( /images/layoutNew/bgTituloGeral.png )');
    });
};
// ------------------------------- /Logo Parceiro/Empresa -----------------------------

// ----------------------------------- /IFrame --------------------------------------


// ----------------------------------- Facebook --------------------------------------
html_body = "";

html_body = '<div id="fb-root"></div>';

$('body').append(html_body);

(function (d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "//connect.facebook.net/pt_BR/all.js#xfbml=1&appId=411134985579132";
    fjs.parentNode.insertBefore(js, fjs);
} (document, 'script', 'facebook-jssdk'));

// ----------------------------------- /Facebook --------------------------------------


// ----------------------------------- Google +1 --------------------------------------

html_head = "";

html_head += '<!-- Google+1 button -->';
html_head += '   <meta itemprop="name" content="JobClick" />';
html_head += '	<meta itemprop="description" content="Bem-vindo ao JobClick, o primeiro buscador de empregos 100% gratuito para profissionais. Procure seu emprego e hospede seu currículo." />';
html_head += '	<meta itemprop="image" content="http://www.jobclick.com.br/icone.ico" />';
html_head += '<!-- /Google+1 button -->';

$('head').append(html_head);

window.___gcfg = { lang: 'pt-BR' };

(function () {
    var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
    po.src = 'https://apis.google.com/js/plusone.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
})();
// ----------------------------------- /Google +1 --------------------------------------


// ----------------------------------- /Twitter --------------------------------------
!function (d, s, id) { var js, fjs = d.getElementsByTagName(s)[0]; if (!d.getElementById(id)) { js = d.createElement(s); js.id = id; js.src = "//platform.twitter.com/widgets.js"; fjs.parentNode.insertBefore(js, fjs); } } (document, "script", "twitter-wjs");
// ----------------------------------- Twitter --------------------------------------
