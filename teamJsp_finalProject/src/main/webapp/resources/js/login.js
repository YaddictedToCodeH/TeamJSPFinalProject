$(function(){
    var cookieId = getCookie("sonicboom_id");
    if(cookieId != "undefined"){
        $("#username").val(cookieId);
        $("#saveId").attr("checked", true);
    }
    $(".login").click(function(){
        var id = $("#username").val();
        var pw = $("#password").val();
        if(id == ""){
            $(".loginIdMsg").css("display", "block");
        }else if(pw == ""){
            $(".loginIdMsg").css("display", "none");
            $(".loginPwMsg").css("display", "block");
        }else{
            $(".loginIdMsg").css("display", "none");
            $(".loginPwMsg").css("display", "none");
            var idChk = $("#saveId").is(":checked");
            if(idChk){
                setCookie("sonicboom_id", id, 30);
            }else{
                deleteCookie("sonicboom_id");
            }
            document.loginAccess.submit();
        }
    });
})

function setCookie(cookieName, value, exdays){
    var exdate = new Date();
    exdate.setDate(exdate.getDate() + exdays);
    // 쿠키 저장 기간
    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
    document.cookie = cookieName + "=" + cookieValue;
}

function getCookie(cookieName){
    cookieName = cookieName + '=';
    var cookieData = document.cookie;
    var start = cookieData.indexOf(cookieName);
    var cookieValue = '';
    if(start != -1){
        start += cookieName.length;
        var end = cookieData.indexOf(';', start);
        if(end == -1)end = cookieData.length;
        cookieValue = cookieData.substring(start, end);
    }
    return unescape(cookieValue); 
}

function deleteCookie(cookieName){
    var expireDate = new Date();
    expireDate.setDate(expireDate.getDate() - 1);
    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
}

