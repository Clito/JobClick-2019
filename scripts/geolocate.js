/*!
 * jQuery Cookie Plugin v1.3
 * https://github.com/carhartl/jquery-cookie
 *
 * Copyright 2011, Klaus Hartl
 * Dual licensed under the MIT or GPL Version 2 licenses.
 * http://www.opensource.org/licenses/mit-license.php
 * http://www.opensource.org/licenses/GPL-2.0
 */
(function ($, document, undefined) {

    var pluses = /\+/g;

    function raw(s) {
        return s;
    }

    function decoded(s) {
        return decodeURIComponent(s.replace(pluses, ' '));
    }

    var config = $.cookie = function (key, value, options) {

        // write
        if (value !== undefined) {
            options = $.extend({}, config.defaults, options);

            if (value === null) {
                options.expires = -1;
            }

            if (typeof options.expires === 'number') {
                var days = options.expires, t = options.expires = new Date();
                t.setDate(t.getDate() + days);
            }

            value = config.json ? JSON.stringify(value) : String(value);

            return (document.cookie = [
				encodeURIComponent(key), '=', config.raw ? value : encodeURIComponent(value),
				options.expires ? '; expires=' + options.expires.toUTCString() : '', // use expires attribute, max-age is not supported by IE
				options.path ? '; path=' + options.path : '',
				options.domain ? '; domain=' + options.domain : '',
				options.secure ? '; secure' : ''
            ].join(''));
        }

        // read
        var decode = config.raw ? raw : decoded;
        var cookies = document.cookie.split('; ');
        for (var i = 0, l = cookies.length; i < l; i++) {
            var parts = cookies[i].split('=');
            if (decode(parts.shift()) === key) {
                var cookie = decode(parts.join('='));
                return config.json ? JSON.parse(cookie) : cookie;
            }
        }

        return null;
    };

    config.defaults = {};

    $.removeCookie = function (key, options) {
        if ($.cookie(key) !== null) {
            $.cookie(key, null, options);
            return true;
        }
        return false;
    };

})(jQuery, document);

function setCookie(c_name, value, exdays) {
    var exdate = new Date();
    exdate.setDate(exdate.getDate() + exdays);
    var c_value = escape(value) + ((exdays == null) ? "" : "; expires=" + exdate.toUTCString());
    document.cookie = c_name + "=" + c_value;
}

function getCookie(c_name) {
    var i, x, y, ARRcookies = document.cookie.split(";");
    for (i = 0; i < ARRcookies.length; i++) {
        x = ARRcookies[i].substr(0, ARRcookies[i].indexOf("="));
        y = ARRcookies[i].substr(ARRcookies[i].indexOf("=") + 1);
        x = x.replace(/^\s+|\s+$/g, "");
        if (x == c_name) {
            return unescape(y);
        }
    }
}

var GEO_Estado = $.cookie('GEO_Estado')
var GEO_Cidade = $.cookie('GEO_Cidade')
console.log("GEO_Estado: " + GEO_Estado);
console.log("GEO_Cidade: " + GEO_Cidade);

if (GEO_Estado == null) {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(function (e) {
            var latitude = e.coords.latitude;
            var longitutde = e.coords.longitude;
            var latlng = new google.maps.LatLng(latitude, longitutde)

            var geocoder = new google.maps.Geocoder();
            geocoder.geocode({ 'latLng': latlng },
                function (data, status) {
                    for (i = 0; i <= (data[0].address_components.length - 1) ; i++) {
                        switch (data[0].address_components[i].types[0]) {
                            case 'administrative_area_level_1':
                                short_name = data[0].address_components[i].short_name
                                if (short_name == 'São Paulo') {
                                    short_name = 'SP';
                                }
                                try {
                                    /*setCookie('GEO_Estado', short_name, 30);*/
                                    $.cookie('GEO_Estado', short_name, { Expires: 30, path: '/' });
                                }
                                catch (err)
                                {
                                    console.log("Erro no set do cookie de Geolocalização de Estado: " + err)
                                }

                                GEO_Estado = short_name;
                                console.log('Estado: ' + short_name);
                                break;
                            case 'locality':
                                try {
                                    $.cookie('GEO_Cidade', data[0].address_components[i].long_name, { Expires: 30, path: '/' });
                                    /*setCookie('GEO_Cidade', data[0].address_components[i].long_name, 30);*/
                                }
                                catch (err) {
                                    console.log("Erro no set do cookie de Geolocalização de Cidade: " + err)
                                }

                                GEO_Estado = data[0].address_components[i].long_name;
                                console.log('Cidade: ' + data[0].address_components[i].long_name);
                                break;
                        }
                    };
                });
        })
    }
    else {
        console.log('Desculpe, mas seu navegador não suporta Geolocation.');
    }
}