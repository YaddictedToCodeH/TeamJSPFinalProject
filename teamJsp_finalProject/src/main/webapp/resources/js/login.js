$(function(){
    $(".login").click(function(){
        var id = $("#id").val();
        var pw = $("#pw").val();
        if(id == ""){
            $(".loginIdMsg").css("display", "block");
        }else if(pw == ""){
            $(".loginIdMsg").css("display", "none");
            $(".loginPwMsg").css("display", "block");
        }else{
            $(".loginIdMsg").css("display", "none");
            $(".loginPwMsg").css("display", "none");
            document.loginAccess.submit();
        }
    });
})