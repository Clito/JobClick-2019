/// <reference path="~/jquery-1.7.min.js" />

//----------------- Constants ----------------//
var jobclick_config = {};
var previousBody;

var QueryString = window.location.search.substring(1);
var vars = QueryString.split("&");
var jobclick_config = new Array();
for (var i = 0; i < vars.length; i++) {
    var transform = vars[i].split("=");
    jobclick_config[transform[0]] = transform[1].replace("%20", " ");
}

make_options();

//----------------- Constants ----------------//

$(document).ready(function () {

    $('#Painel_Jobclick').append(jobclick_carregando());
    $('#Painel_Jobclick').append('<iframe id="Vagas_Jobclick" name="Vagas_Jobclick" src="' + jobclick_config['url'] + '" frameborder="0" width="100%" height="100%" style="min-height: 550px" allowtransparency="true" marginheight="0" marginwidth="0" scrolling="no" onload="javascript:jobclick_carregado()"> </iframe>');

    checkPreviousInnerHTML(document.body.innerHTML);
});


function jobclick_carregando() {

    html_result = "";

    html_result += '<div id="jobclick_carregando">';
    html_result += '<table border="0px" cellpadding="0px" cellspacing="0px" style="height: 50px; color: #000000; width:100%" >';
    html_result += '<tr style="background-color: Black">';
    html_result += '<td style="text-align: center; background-color: #EEEEEE" id="moreText">';
    html_result += '<img src="http://www.jobclick.com.br/images/loading.gif" alt="" />';
    html_result += '<span style="font-family: verdana">&nbsp;Carregando Sistema <strong><span style="color: red">Job</span>click</strong>... Aguarde!</a>';
    html_result += '</td>';
    html_result += '</tr>';
    html_result += '</table>';
    html_result += '</div>';

    return html_result;
}

function jobclick_carregado() {

    $("#jobclick_carregando").slideUp(500);
}

function make_options() {
    var default_args = {
                  'action': "bemvindo"
                , 'partnerkey': 0
                , 'idparceiro': 0
                , 'companykey': 0
                , 'idempresa': 0
                , 'logo': true
                , 'cidade': ""
                , 'estado': ""
                , 'menu': "none"
                , 'partner': false
                , 'poweredby': true
                , 'page': ""
                , 'jobclick_height': 0
                , 'server': "http://www.jobclick.com.br" //com "HTTP://" e sem "/" no final
                , 'url': ""
                , 'css': "red"
				, 'redirections': ""
				, 'jobclick_callback': ""
    };

    for (var index in default_args) {
        if (typeof jobclick_config[index] == "undefined") jobclick_config[index] = default_args[index];
    }

    try {
        jobclick_config['redirections'] = "jobclick=http://www.jobclick.com.br&" + jobclick_config['redirections'].replace(/\[_61_]/g, "?").replace(/\[_63_]/g, "=").replace(/\[_38_]/g, "&");
    }
    catch (err) {
        //alert(err)
    }

    try {
        jobclick_config['jobclick_callback'] = jobclick_config['jobclick_callback'].replace(/\[_61_]/g, "?").replace(/\[_63_]/g, "=").replace(/\[_38_]/g, "&");
    }
    catch (err) {
        //alert(err)
    }


    if (jobclick_config['partnerkey'] != 0) {
        jobclick_config['idparceiro'] = decode64(unescape(jobclick_config['partnerkey']));
    }

    if (jobclick_config['companykey'] != 0) {
        jobclick_config['idempresa'] = decode64(unescape(jobclick_config['companykey']));
    }

    switch (jobclick_config['action']) {
        case "painel":
            var pesquisa = "";

            if (jobclick_config['jobclick_callback'].search("pesquisa") > 0) {
                pesquisa = jobclick_config['jobclick_callback']
                pesquisa = pesquisa.substring(pesquisa.search("pesquisa"), 999);
                if (pesquisa.search(/\&/g) > 0)
                    pesquisa = pesquisa.substring(0, pesquisa.search(/\&/g));
            }

            jobclick_config['page'] = '/_anonimo/vagas.aspx?' + pesquisa;
            break;
        case "empresa":
            jobclick_config['page'] = '/_anonimo/cadastroempresa.aspx';
            break;
        case "associado":
            jobclick_config['page'] = '/_anonimo/cadastroassociado.aspx';
            break;
        case "candidato":
            jobclick_config['page'] = '/_anonimo/cadastrocandidato.aspx';
            break;
        case "login":
            jobclick_config['page'] = '/login.aspx?panelON=1';
            break;
        case "faq":
            jobclick_config['page'] = '/faq.aspx';
            break;
        case "bemvindo":
            jobclick_config['page'] = '/bemvindo.aspx?idempresa=' + jobclick_config['idempresa'];
            break;
    }
	
    jobclick_config['url'] = jobclick_config['server'] + jobclick_config['page'];

};

function callback() {
    if (jobclick_config['jobclick_callback'] != "") {
        var thechar = "&";
        if (jobclick_config['jobclick_callback'].search(/\?/g) == -1) {
            thechar = "?";
        };

        $('#Jobclick_Callback').html('<iframe src="' + jobclick_config['jobclick_callback'] + thechar + 'jobclick_callback=true&jobclick_height=' + jobclick_config['jobclick_height'] + '" frameborder="0" width="0" height="0" style="min-height: 0px; min-width: 0px; display:none;" allowtransparency="true" marginheight="0" marginwidth="0" scrolling="no" />');
    };
}

function redirect(page) {
    if (jobclick_config['jobclick_callback'] != "") {
        var thechar = "&";
        if (jobclick_config['jobclick_callback'].search(/\?/g) == -1) {
            thechar = "?";
        };

        var redirectpages = jobclick_config['redirections'];
        var opt = redirectpages.split("&");
        for (var i = 0; i < opt.length; i++) {
            var transform = opt[i].split("=");
            if (transform[0] == page) {

                $('#Jobclick_Redirect').html('<iframe src="' + jobclick_config['jobclick_callback'] + thechar + 'jobclick_callback=true&jobclick_redirect=' + transform[1] + '" frameborder="0" width="0" height="0" style="min-height: 0px; min-width: 0px; display:none;" allowtransparency="true" marginheight="0" marginwidth="0" scrolling="no" />');
            };
        };
    };

}

function checkPreviousInnerHTML(NewBody) {
    if (previousBody != NewBody) {
        callback();
        previousBody = NewBody;
    };
    setTimeout("checkPreviousInnerHTML(document.body.innerHTML)", 33);

};

function decode64(input) {
    var keyStr = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=";
    var output = "";
    var chr1, chr2, chr3 = "";
    var enc1, enc2, enc3, enc4 = "";
    var i = 0;

    // remove all characters that are not A-Z, a-z, 0-9, +, /, or =
    var base64test = /[^A-Za-z0-9\+\/\=]/g;
    if (base64test.exec(input)) {
        alert("There were invalid base64 characters in the input text.\n" +
               "Valid base64 characters are A-Z, a-z, 0-9, ´+´, ´/´, and ´=´\n" +
               "Expect errors in decoding.");
    }
    input = input.replace(/[^A-Za-z0-9\+\/\=]/g, "");

    do {
        enc1 = keyStr.indexOf(input.charAt(i++));
        enc2 = keyStr.indexOf(input.charAt(i++));
        enc3 = keyStr.indexOf(input.charAt(i++));
        enc4 = keyStr.indexOf(input.charAt(i++));

        chr1 = (enc1 << 2) | (enc2 >> 4);
        chr2 = ((enc2 & 15) << 4) | (enc3 >> 2);
        chr3 = ((enc3 & 3) << 6) | enc4;

        output = output + String.fromCharCode(chr1);

        if (enc3 != 64) {
            output = output + String.fromCharCode(chr2);
        }
        if (enc4 != 64) {
            output = output + String.fromCharCode(chr3);
        }

        chr1 = chr2 = chr3 = "";
        enc1 = enc2 = enc3 = enc4 = "";

    } while (i < input.length);

    return output;
}