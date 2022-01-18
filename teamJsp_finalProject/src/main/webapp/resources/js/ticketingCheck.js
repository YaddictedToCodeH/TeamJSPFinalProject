$(function(){
    $(".nextStep").click(function(){
        var usePoint_price = $("input[name='usePoint_price']").val();
        var usePoint = $("input[name='usePoint']").val();
        usePoint = usePoint.replace(/[^0-9]/g,"");
        usePoint_price = usePoint_price.replace(/[^0-9]/g,"");
        var detail_seat = $("input[name='detail_seat']").val();
        var area = $("input[name='area']").val();
        var game_date = $("input[name='game_date']").val();
        var game_arena = $("input[name='game_arena']").val();
        var team_name = $("input[name='team_name']").val();
        var team_name2 = $("input[name='team_name2']").val();
        var team_logo = $("input[name='team_logo']").val();
        var team_logo2 = $("input[name='team_logo2']").val();
        var grade = $("input[name='grade']").val();


        $.ajax({
            url: "../kakaopay?usePoint_price="+usePoint_price+"&detail_seat=" + detail_seat
                + "&area=" + area + "&game_date=" + game_date + "&game_arena=" + game_arena
                + "&team_name=" + team_name + "&team_name2=" + team_name2 + "&team_logo=" + team_logo 
                + "&team_logo2=" + team_logo2 + "&usePoint=" + usePoint + "&grade=" + grade,
            dataType: "json",
            success: function (data) {
				window.open(data.next_redirect_pc_url); // 새창 열기
                location.href = "../payment?usePoint_price=" + usePoint_price + "&detail_seat=" + detail_seat
                + "&area=" + area + "&game_date=" + game_date + "&game_arena=" + game_arena
                + "&team_name=" + team_name + "&team_name2=" + team_name2 + "&team_logo=" + team_logo + "&team_logo2=" + team_logo2 
                + "&usePoint=" + usePoint + "&grade=" + grade;
            },
            error: function(error){
                alert(error);
            }
        });
    })
})