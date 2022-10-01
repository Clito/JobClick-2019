/// <reference path="~/jquery-1.7.min.js" />

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