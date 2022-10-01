if (jobclick_config['server'] == undefined) {
    jobclick_config['server'] = 'http://www.jobclick.com.br';
};

if (jobclick_config['scroll_botton_height'] == undefined) {
    jobclick_config['scroll_botton_height'] = 600;
};

function make_URL() {

    options = "options=";

    /* options[] has all the data - user provided and optional */
    for (var i in jobclick_config) {
        //alert(i + " = " + jobclick_config[i]);
        options += "&"
		try {
			options += i + "=" + jobclick_config[i].replace(/\=/g, "[_63_]").replace(/\&/g, "[_38_]");
		}
		catch (err) {
			options += i + "=" + jobclick_config[i];
		}
    } 
	
	options += "&jobclick_callback=" + document.location.href.replace(/\?/g, "[_61_]").replace(/\=/g, "[_63_]").replace(/\&/g, "[_38_]");

	return jobclick_config['server'] + '/landing.aspx?' + options;

}

function jobclick() {

    URL = make_URL();
	
	isCallback = check_jobclick_callback();
	
	if (isCallback == false) {
	
		minheight = 550;

		if (jobclick_config["minheight"] != undefined) {
			minheight = jobclick_config["minheight"]
		};

		html_result = "";

		html_result += '<div id="Landing_Jobclick_div">';
		html_result += '<iframe id="Landing_Jobclick" name="Landing_Jobclick" src="' + URL + '" frameborder="0" width="100%" style="min-height: ' + minheight + 'px" allowtransparency="false" marginheight="0" marginwidth="0" scrolling="no"> </iframe>';
		html_result += '</div>';
		html_result += '<div id="Landing_Jobclick_div_more" name="Landing_Jobclick_div_more" style="width: 0px; height: 0px; display:none">';
		html_result += '</div>';
		if (jobclick_config['poweredby'] != false) {
		    html_result += '<div id="poweredby" style="text-align: right"><a href="http://www.jobclick.com.br" target="_blank" border="0"><img alt="Powered By Jobclick" src="http://www.jobclick.com.br/images/layoutNew/logopoweredby.png" /></a></div>';
		};

		document.writeln(html_result);
	}
	else {
	    theframe = window.top.document.getElementById("Landing_Jobclick");
		
		var QueryString = window.location.search.substring(1);
        var vars = QueryString.split("&");
		var result
        for (var i = 0; i < vars.length; i++) {
            var transform = vars[i].split("=");
            if (transform[0] == "jobclick_height") {
                try {
                    theframe.style.height = transform[1] + "px";
                }
                catch (err) {
                    try {
                        theframe.height = transform[1] + "px";
                    }
                    catch (err) {
                        try {
                            theframe.offsetheight = transform[1] + "px";
                        }
                        catch (err) {
                        }
                    }
                }
				break;
			}
            if (transform[0] == "jobclick_redirect") {		
				window.top.location.href = transform[1];
				break;
			}
        }
	};
};

function check_jobclick_callback() {
        var QueryString = window.location.search.substring(1);
        var vars = QueryString.split("&");
		var result
        for (var i = 0; i < vars.length; i++) {
            var transform = vars[i].split("=");
            if (transform[0] == "jobclick_callback") {
				result = true;
				break;
			}
			else
			{
				result = false;
			};
        }
		
		return result;
}

window.onscroll = jobclick_scroll;  
  
function jobclick_scroll()  
{
    theframe = window.top.document.getElementById("Landing_Jobclick")

    try {
        theframeheight = theframe.style.height.replace(/px/, '') * 1;
    }
    catch (err) {
        try {
            theframeheight = theframe.height.replace(/px/, '') * 1;
        }
        catch (err) {
            try {
                theframeheight = theframe.offsetheight.replace(/px/, '') * 1;
            }
            catch (err) {
            }
        }
    }

    theframeheight = theframeheight - jobclick_config['scroll_botton_height'];

    windowheight = 0;

    if (typeof (window.pageYOffset) == 'number') {
        //Netscape compliant
        windowscrollheight = window.pageYOffset;
    } else if (document.body && (document.body.scrollTop)) {
        //DOM compliant
        windowscrollheight = document.body.scrollTop;
    } else if (document.documentElement && (document.documentElement.scrollTop)) {
        //IE6 standards compliant mode
        windowscrollheight = document.documentElement.scrollTop;
    }
	
	if (windowscrollheight >= theframeheight) {
	    thediv = window.top.document.getElementById("Landing_Jobclick_div_more");
	    thediv.innerHTML = '<iframe id="Landing_Jobclick_more" src="' + jobclick_config['server'] + '/landing_more.aspx" frameborder="0" width="100%" style="min-height: 0px; display:none" allowtransparency="true" marginheight="0" marginwidth="0" scrolling="no"> </iframe>';
	};
 // note: you can use window.innerWidth and window.innerHeight to access the width and height of the viewing area  
}

jobclick();

function test() { alert('API Jobclick') };