$(function(){
    $("#allCheck").click(function() {
		if($("#allCheck").is(":checked")){
            $("input[name^=check]").prop("checked", true);
        }else{
            $("input[name^=check]").prop("checked", false);   
        }
	});

	$("input[name^=check]").click(function() {
		var total = $("input[name^=check]").length;
		var checked = $("input[name^=check]:checked").length;

		if(total != checked){
            $("#allCheck").prop("checked", false);   
        }else{
            $("#allCheck").prop("checked", true); 
        }
	});

    $("#confirm").click(function(){
        if($("input[name=check1]").is(":checked") == false){
            alert("필수 약관 모두 동의 후 진행해 주세요.");
            $("label[for=check1]").css({"color":"red"}).focus();
        }else if($("input[name=check2]").is(":checked") == false){
            alert("필수 약관 모두 동의 후 진행해 주세요.");
            $("label[for=check1]").css({"color":"black"});
            $("label[for=check2]").css({"color":"red"}).focus();
        }else{
            $("label[for=check1]").css({"color":"black"});
            $("label[for=check2]").css({"color":"black"});
            document.registerTerm.submit();
        }
    })
})