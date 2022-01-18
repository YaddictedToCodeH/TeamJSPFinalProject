var usePoint_price;
var usePoint = 0;
$(function(){
    $(".coupon-btn").click(function(){
        alert("사용 가능한 쿠폰이 없습니다.");
    })
    $(".point-btn").click(function(){
        var point = parseInt($("#point").val().trim());
        var myPoint = parseInt($("#myPoint").val().trim());
        if(point == "" || point == 0){
            alert("적용할 포인트를 입력해주세요.");
            $("#point").val("");
        }else if(point > 0 && point <= myPoint){
            var result = confirm(point+"포인트 사용하시겠습니까?");
            if(result){
                $(".usePoint").html("(-) " + point + " P");
                usePoint = point;
                Calculate();
            }else{
                $("#point").val("");
            }
        }else{
            alert("사용 할 수 있는 포인트를 초과하셨습니다.");
            $("#point").val("");
        }
    })
    $("#point").on("keyup", function() {
        $(this).val($(this).val().replace(/[^0-9]/g,""));
    });

    Calculate();


    $(".nextStep").click(function(){
        $("input[name='usePoint_price']").val(usePoint_price);
        $("input[name='usePoint']").val(usePoint);
        var form = document.TicketingCheck;
        form.submit();
    })
})

function Calculate(){
    var total_price = $("#total_price").val();
    usePoint_price = total_price - usePoint;
    $(".usePoint_price").html(usePoint_price + " 원");
    console.log(usePoint_price);
    console.log(usePoint);
    console.log(total_price);
}