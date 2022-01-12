$(function(){
    var code;
    var idOk = false;
    var pw1Ok = false;
    var pw2Ok = false;
    var mailOk = false;

    /* 아이디 입력칸에는 영문 또는 숫자만 가능 */
	$('#id').keyup(function() {
        idOk = false;
        $(".idP").html("");
		var inputVal = $(this).val();
		$(this).val((inputVal.replace(/[ㄱ-힣~!@#$%^&*()_+|<>?:{}= ]/g, '')));
	});

    /* 아이디 중복확인 */
	$("#checkId").on("click", function() {
		var joinId = $("#id").val().trim();
		if (joinId.length < 8) {
            $(".idP").html("ID의 길이는 최소 8글자 입니다. 다시 입력해 주세요.");
			$(".idP").css("color", "red");
			$("#id").addClass("redBorder");
		} else if(joinId.length > 15){
            $(".idP").html("ID의 길이는 최대 15글자 입니다. 다시 입력해 주세요.");
			$(".idP").css("color", "red");
			$("#id").addClass("redBorder");
        } else {
            $(".idP").html("");
            var id = $("#id").val();
            $.ajax({
                type:"GET",
                url:"idDoubleCheck?id=" + id,
                cache : false,
                success:function(data){
                    if(data == "error"){
                        $(".idP").html("중복된 ID가 존재합니다. 다른아이디를 입력해주세요.");
                        $(".idP").css("color", "red");      
                    }else{
                        $(".idP").html("사용 가능한 ID입니다.");
                        $(".idP").css("color", "green");      
                        idOk=true;
                    }
                }
            });
		}
	})

    /* 패스워드 일치하는지 확인 */
	$("#pwOk").on("keyup", function() {
		pw2Ok = false;
        if(pw1Ok == true){
		    pwKeyUp();
        }
	})
	$("#pw").on("keyup", function() {
        pw1Ok = false;
        var pw1 = $("#pw").val().trim();
        if(pw1.length < 7){
            $(".pw1P").html("비밀번호를 7자 이상으로 설정해 주세요.");
            $(".pw1P").css("color", "red");
        }else if(pw1.length > 15){
            $(".pw1P").html("비밀번호를 15자 이하로 설정해 주세요.");
            $(".pw1P").css("color", "red");
        }else{
            $(".pw1P").html("사용 할 수 있는 비밀번호 입니다.");
            $(".pw1P").css("color", "green");
            pw1Ok = true;
            if($("#pwOk").val() != ""){
                pwKeyUp();
            }
        }
	})


    // 이름 유효성검사
    $("#name").on("keyup", function() {
		$(this).val( $(this).val().replace(/[a-z0-9]|[ \[\]{}()<>?|`~!@#$%^&*-_+=,.;:\"\\]/g,"") );
	});

    // 주민등록번호 유효성 검사
    $("#birth").on("keyup", function() {
        $(this).val($(this).val().replace(/[^0-9]/g,""));
        var value = $(this).val();
        if(value.length == 6){
            $("#genderNum").focus();
        }else if(value.length > 6){
            $(this).val(value.slice(0, -1));
        }
    });
    $("#genderNum").on("keyup", function() {
        $(this).val($(this).val().replace(/[^0-9]/g,""));
        var value = $(this).val();
        if(value.length > 1){
            $(this).val(value.slice(0, -1));
        }
        if(value % 2 == 1){
            $(".gender").html("남성");
        }else if(value == 0){
            $(".gender").html("");
        }else{
            $(".gender").html("여성");
        }
    });

    // 휴대폰 번호 유효성 검사
    $("#phone1").on("keyup", function() {
        $(this).val($(this).val().replace(/[^0-9]/g,""));
        var value = $(this).val();
        if(value.length == 3){
            $("#phone2").focus();
        }else if(value.length > 3){
            $(this).val(value.slice(0, -1));
        }
    });
    $("#phone2, #phone3").on("keyup", function() {
        $(this).val($(this).val().replace(/[^0-9]/g,""));
        var value = $(this).val();
        if(value.length == 4){
            $("#phone3").focus();
        }else if(value.length > 4){
            $(this).val(value.slice(0, -1));
        }
    });
    


    // 카카오 주소
    $("#findAddr").click(function(){
        console.log("클릭");
        new daum.Postcode({
            oncomplete: function(data) {
                $("#addrNum").val(data.zonecode);
                $("#addr1").val(data.address);
                if(data.buildingName != ""){
                    $("#addr1").val(data.address + " (" + data.buildingName + ")");
                }
            }
        }).open();
    })
    
    //이메일 인증
    $("#sendMail").click(function(){
        var sm_email = $("#mailId").val().trim() + "@" +$("#mailAddress").val().trim();
        console.log(sm_email);

        $.ajax({
            type:"GET",
            url:"mailDoubleCheck?sm_email=" + sm_email,
            cache : false,
            success:function(data){
                if(data == "error"){
                    $(".mailP").text("중복된 이메일 주소가 있습니다.");
                    $(".mailP").css("color","red");
                }else if(data == "success"){
                    $.ajax({
                        type:"GET",
                        url:"mailCheck?sm_email=" + sm_email,
                        cache : false,
                        success:function(data){
                            if(data == "error"){
                                $(".mailP").text("유효한 이메일 주소를 입력해주세요.");
                                $(".mailP").css("color","red");
                            }else{	        		
                                alert("인증번호 발송이 완료되었습니다.\n입력한 이메일에서 인증번호 확인을 해주십시오.");
                                $(".mailP").text("인증번호를 입력한 뒤 이메일 인증을 눌러주십시오.");
                                $(".mailP").css("color","green");
                                console.log("성공"); 
                                code = data;
                            }
                        }
                    });
                }
            }
        });
    });

    //이메일 인증번호 대조
    $("#checkMail").click(function(){
        console.log("클릭");
        if($("#certificationNum").val() == code){
            $(".checkMailP").text("인증번호가 일치합니다.");
            $(".checkMailP").css("color","green");
            $("#mailId, #mailAddress, #certificationNum").css("readonly", "readonly");
            mailOk = true;
        }else{
            $(".checkMailP").text("인증번호가 일치하지 않습니다.");	
            $(".checkMailP").css("color","red");
            $("#certificationNum").attr("autofocus",true);
        }
    });



    /* 회원가입 */
	$("#registerOk").on("click", function() {
        var phone1 = $("#phone1").val();
        var phone2 = $("#phone2").val();
        var phone3 = $("#phone3").val();
		if (idOk == false) {
			$(".idP").html("ID 중복확인을 해주세요.");
			$(".idP").css("color", "red");
			$("#id").focus();
		} else if (mailOk == false) {
            $(".idP").html("");
			$(".checkMailP").html("이메일 인증을 해주세요.");
			$(".checkMailP").css("color", "red");
		} else if (pw2Ok == false) {
            $(".emailCheck").html("");
			$(".pwOkP").html("비밀번호를 다시 입력해주세요.");
			$(".pwOkP").css("color", "red");
		} else if($("#name").val().length == 0){
            $(".pwOkP").html("");
			$(".nameP").html("이름을 입력해주세요.");
			$(".nameP").css("color", "red");
		} else if (phone1.length != 3 || phone2.length != 4 || phone3.length != 4) {
            $(".nameP").html("");
            $(".phoneP").html("휴대폰 번호를 다시 입력해주세요.");
			$(".phoneP").css("color", "red");
		}else if($("#birth").val().length != 6){
            $(".phoneP").html("");
            $(".birthP").html("주민등록번호를 제대로 입력해주세요.");
			$(".birthP").css("color", "red");
        }else if($("#genderNum").val().length != 1){
            $(".birthP").html("주민등록번호를 제대로 입력해주세요.");
			$(".birthP").css("color", "red");
        }else if($("#addr1").val().length == 0){
            $(".birthP").html("");
            $(".addrP").html("주소를 제대로 입력해주세요.");
			$(".addrP").css("color", "red");
        }else if($("#addr2").val().length == 0){
            $(".addrP").html("상세주소를 제대로 입력해주세요.");
			$(".addrP").css("color", "red");
        }else{
			document.getElementById("registerOk").submit(); 			
		}
	})

})

function pwKeyUp(){
    var pw1 = $("#pw").val();
    var pw2 = $("#pwOk").val();
    $.ajax({
        type:"GET",
        url:"registerPwDoubleCheck?pw1=" + pw1 + "&pw2=" + pw2,
        cache : false,
        success:function(data){
            if(data == "error"){
                $(".pw2P").html("비밀번호가 일치하지 않습니다.");
                $(".pw2P").css("color", "red");
            }else{	        		
                $(".pw2P").html("비밀번호가 일치합니다.");
                $(".pw2P").css("color", "green");
                pw2Ok = true;
            }
        }
    })
}