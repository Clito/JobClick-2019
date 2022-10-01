function getParameterByName(name) {
    name = name.replace(/[\[]/, "\\\[").replace(/[\]]/, "\\\]");
    var regexS = name + "=([^&#]*)";
    var regex = new RegExp(regexS);
    var results = regex.exec(window.location);
    if (results == null)
        return "";
    else
        return decodeURIComponent(results[1].replace(/\+/g, " "));
}


$(document).ready(function () {
    $('.TextBox_Page_id').hide();
    $('.TextBox_Page_name').hide();
    $('.TextBox_AccessToken').hide();

    var user_access_token_shortlive = getParameterByName('#access_token');
    var user_access_token_longlive;

    if (user_access_token_shortlive != "") {
        $('.TextBox_UserAccessToken_ShortLive').val(user_access_token_shortlive);
    }

    /*
    https://graph.facebook.com/oauth/authorize?client_id=411134985579132&scope=publish_stream,manage_pages&redirect_uri=http://alpha.jobclick.com.br/facebook/permissaofanpage.aspx%3FidClient=1&response_type=token
    https://graph.facebook.com/oauth/access_token?client_id=411134985579132&client_secret=1cf9779139244586b3da1d906eb32bfd&grant_type=fb_exchange_token&fb_exchange_token=AAAFFBrmAIHIBAOGC9UASgtJmGjmqLzrDZAVeMx5G5eHJxybdQYZCnXewZCdzP7pfkZAbvD7EpQmvCLFYxfilexXlNX5v1BRW41NZCrT2izAZDZD 
    */

    var fburl = "https://graph.facebook.com/oauth/access_token?client_id=411134985579132&client_secret=1cf9779139244586b3da1d906eb32bfd&grant_type=fb_exchange_token&fb_exchange_token=" + user_access_token_shortlive
    $.ajax({
        type: "POST",
        async: false,
        url: fburl,
        dataType: "text",
        success: function (data) {
            user_access_token_longlive = data.replace("access_token=", "")
            $('.TextBox_UserAccessToken_LongLive').val(user_access_token_longlive);
        }
    });



    var fburl = "https://graph.facebook.com/me/accounts?access_token=" + user_access_token_longlive
    var ddData = [];
    $.ajax({
        type: "POST",
        async: false,
        url: fburl,
        dataType: "jsonp",
        success: function (fbdata) {
            $.each(fbdata.data, function (i, item) {
                if (item.category != "Application") {
                    ddData.push(
                     {
                         name: item.name,
                         value: item.id,
                         selected: false,
                         description: item.name,
                         imageSrc: "/images/layoutNew/facebook.gif",
                         access_token: item.access_token,
                         page_id: item.id
                     });
                }
            });


            $('.Select_Fanpage').ddslick({
                data: ddData,
                width: 800,
                imagePosition: "left",
                selectText: "Selecione uma Fanpage",
                onSelected: function (data) {
                    console.log(data)

                    $('.TextBox_Page_id').val(data.selectedData.page_id);
                    $('.TextBox_Page_name').val(data.selectedData.name);
                    $('.TextBox_AccessToken').val(data.selectedData.access_token);
                }
            });
        }
    });

});