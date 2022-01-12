$(function(){
    var code = "";
    $(".certificationRequest").click(function(){
        var firstInput = $(".firstInput").val();
        var emailId = $("#emailId").val();
        var emailAddr = $("#emailAddr").val();
        var fullEmail = emailId + '@' + emailAddr;
        if(firstInput == ""){
            if($("input[name='name']").val()==""){
                $(".errorMsg").html("* 이름을 입력 후 인증요청 버튼을 눌러주세요.");
            }else if($("input[name='id']").val()==""){
                $(".errorMsg").html("* 아이디를 입력 후 인증요청 버튼을 눌러주세요.");
            }
            $(".error").css("display" , "table-row");
        }else if(emailId == "" || emailAddr == ""){
            $(".error").css("display" , "table-row");
            $(".errorMsg").html("* 이메일을 입력 후 인증요청 버튼을 눌러주세요.");
        }else if(!validateEmail(fullEmail)){
            $(".error").css("display" , "table-row");
            $(".errorMsg").html("* 이메일 형식을 확인 후 다시 입력해주세요.");
        }else{
            $("input").attr("readonly", true);
            $("input[name='certificationNum']").removeAttr("readonly").removeAttr("disabled");
            var sm_email = $("#emailId").val() + "@" +$("#emailAddr").val();
            $.ajax({
                type:"GET",
                url:"mailCheck?sm_email=" + sm_email,
                cache : false,
                success:function(data){
                    if(data == "error"){
                        $("#mailAddress").attr("autofocus",true);
                        $(".error").css("display" , "table-row");
                        $(".errorMsg").html("유효한 이메일 주소를 입력해주세요.");
                        $(".errorMsg").css("color","red");
                    }else{	        		
                        alert("인증번호 발송이 완료되었습니다.\n입력한 이메일에서 인증번호 확인을 해주십시오.");
                        $(".error").css("display" , "table-row");
                        $(".errorMsg").html("인증번호를 입력한 뒤 이메일 인증을 눌러주십시오.");
                        $(".errorMsg").css("color","green");
                        code = data;
                    }
                }
            });
        }
    });

    $(".certificationOk").click(function(){
        if($("#certificationNum").val() == code){
            $(".error").css("display" , "table-row");
            $(".errorMsg").html("인증번호가 일치합니다.");
            $(".errorMsg").css("color","green");
            $("#certificationNum").attr("disabled",true);

        }else{
            $(".error").css("display" , "table-row");
            $(".errorMsg").html("인증번호가 일치하지 않습니다. 확인해주시기 바랍니다.");
            $(".errorMsg").css("color","red");
            $("#certificationNum").attr("autofocus",true);
        }
    });

    $(".idFindBtn").click(function(){
        var mail = $("#emailId").val() + "@" +$("#emailAddr").val();
        var name = $("#name").val();
        $.ajax({
            type:"GET",
            url:"memberchk?mail=" + mail + "&name=" + name,
            cache : false,
            success:function(data){
                if(data == "error"){
                    $("#mailAddress").attr("autofocus",true);
                    $(".error").css("display" , "table-row");
                    $(".errorMsg").html("해당 회원의 정보가 없습니다.");
                    $(".errorMsg").css("color","red");
                }else{	        		
                    $(".error").css("display" , "table-row");
                    $(".errorMsg").html("회원의 ID는 " + data + "입니다.");
                    $(".errorMsg").css("color", "green");
                }
            }
        })
    })

    $(".pwFindBtn").click(function(){
        var mail = $("#emailId").val() + "@" +$("#emailAddr").val();
        var id = $("#id").val();
        $.ajax({
            type:"GET",
            url:"memberchk?mail=" + mail + "&id=" + id,
            cache : false,
            success:function(data){
                if(data == "error"){
                    $("#mailAddress").attr("autofocus",true);
                    $(".error").css("display" , "table-row");
                    $(".errorMsg").html("해당 회원의 정보가 없습니다.");
                    $(".errorMsg").css("color","red");
                }else{	        		
                    $.ajax({
                        type:"GET",
                        url:"changePw?mail=" + mail,
                        cache : false,
                        success:function(data){
                            if(data == "error"){
                                $("#mailAddress").attr("autofocus",true);
                                $(".error").css("display" , "table-row");
                                $(".errorMsg").html("임시 비밀번호 발급에 문제가 생겼습니다.");
                                $(".errorMsg").css("color","red");
                            }else{	        		
                                alert("임시 비밀번호가 발송이 완료되었습니다.\n입력한 이메일에서 비밀번호를 확인 해주십시오.");
                                $(".error").css("display" , "table-row");
                                $(".errorMsg").html("바뀐 비밀번호로 로그인 해주세요.");
                                $(".errorMsg").css("color","green");
                            }
                        }
                    });

                }
            }
        })
    })
    

})

function selectEmail(ele){
    var $ele = $(ele);
    var $email = $('input[name=emailAddr]');
    // '1'인 경우 직접입력
    if($ele.val() == "1"){
        $email.attr('readonly', false);
        $email.val('');
    }else{
        $email.attr('readonly', true);
        $email.val($ele.val());
    } 
}

function validateEmail(sEmail) {
    var filter = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
    if (filter.test(sEmail)) {
        return true;
    }else {
        return false;
    }
}