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
        if (ver <= 8.0)
            console.log("Navegador Desatualizado");
            // window.location = "/errobrowser.aspx";
    }
}

// checkVersion();

// ----------------------------------- /IFrame --------------------------------------
var partner = true;
var menu = "superior";
var idParceiro = 0;
var idEmpresa = 0;
var Cidade = "";
var Estado = "";
var Logo = true;

if ((typeof parent.jobclick_config) != "undefined") {
    partner = parent.jobclick_config['partner'];
    menu = parent.jobclick_config['menu'];
    idParceiro = parent.jobclick_config['idparceiro'];
    idEmpresa = parent.jobclick_config['idempresa'];
    Cidade = parent.jobclick_config['cidade'];
    Estado = parent.jobclick_config['estado'];
    Logo = parent.jobclick_config['logo']; ;

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
            $('.LoginPanel').css('top', '0');
        }

        /*if (menu != "superior") {
        $('#Nav').hide();
        }*/
    });
};

// ----------------------------------- /IFrame --------------------------------------


// ----------------------------------- Facebook --------------------------------------
html_body = "";

html_body = '<div id="fb-root"></div>';

$('body').append(html_body);

(function (d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "//connect.facebook.net/pt_BR/all.js#xfbml=1&appId=201839233214634";
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
