var grade; // 티켓가격을 위해서 필요함
var area; // 좌석 정보를 위해서 필요함
var arrSeat = new Array(); // 좌석 번호를 위해 필요함
var seat_cnt = 0;


$(document).ready(function () {

    // type1_open
    $(".type1Btn").click(function () {
        $("#popup-modal-overlay").stop().fadeIn(200);
        $(".type1").stop().fadeIn(200);
        $("body").addClass("wrapper");
        grade = $(this).attr("value");
        area = $(".type1Area").val();
        $(".modal-areaName").html(grade);

        resetSeat();
        drawCombobox();
    })
    // type2_open
    $(".type2Btn").click(function () {
        $("#popup-modal-overlay").stop().fadeIn(200);
        $(".type2").stop().fadeIn(200);
        $("body").addClass("wrapper");
        grade = $(this).attr("value");
        area = $(".type2Area").val();
        $(".modal-areaName").html(grade);

        resetSeat();
        drawCombobox2();
    })

    // 닫기 버튼
    $(".ico-close").on("click", function () {
        closeModal();
        resetSeat();
    })
    $(".modal-seatOk").on("click", function () {
        closeModal();
    })

    $(document).on("change", ".type1Area", function(){
        area = this.value;
        drawSeat();
        resetSeat();
    })
    $(document).on("change", ".type2Area", function(){
        area = this.value;
        drawSeat2();
        resetSeat();
    })


    $(document).on("click", ".seat", function(){
        if (this.checked == true) {
            console.log("체크됨");
            if (seat_cnt == 4) {
                this.checked = false;
                alert("1인당 최대예매 매수는 4매입니다.");
            } else {
                arrSeat[seat_cnt] = this.defaultValue;
                seat_cnt++;
                seatList();
            }
        } else {
            for (var i = 0; i < arrSeat.length; i++) {
                if (arrSeat[i] == this.defaultValue) {
                    arrSeat.splice(i, 1);
                    i--;
                }
            }
            seat_cnt--;
            seatList();
        }
    })

    $(".nextStep").on("click",function(){
        var game_date = $("#game_date").val();
        var game_arena = $("#game_arena").val();
        var team_name = $("#team_name").val();
        var team_name2 = $("#team_name2").val();
        var team_logo = $("#team_logo").val();
        var team_logo2 = $("#team_logo2").val();
        location.href="saleTicket?grade="+grade+"&area="+area+"&arrSeat="+arrSeat+"&game_date="+game_date
                    +"&game_arena=" + game_arena + "&team_name=" + team_name + "&team_name2=" + team_name2
                    + "&team_logo=" + team_logo + "&team_logo2=" + team_logo2;
    })
})

function seatList() {
    $(".modal-myPickList").html("");
    $(".MySelect-list").html("");
    for (var i = 0; i < arrSeat.length; i++) {
        $(".modal-myPickList").append("<p>" + grade + " " + area + " " + arrSeat[i] + "</p>");
        if (i == 0) {
            $(".MySelect-list").append("<table>")
        }
        $(".MySelect-list").append("<tr><td>" + grade + " " + area + " " + arrSeat[i] + "</td></tr>")
        if (i == arrSeat.length) {
            $(".MySelect-list").append("</table>")
        }
    }
}

function closeModal() {
    $("#popup-modal-overlay").stop().fadeOut(200);
    $(".type1").stop().fadeOut(200);
    $(".type2").stop().fadeOut(200);
    $("body").removeClass("wrapper");
}

function drawCombobox() {
    $.ajax({
        type: "GET",
        url: "../getArea?grade=" + grade,
        dataType: "json",
        cache: false,
        success: function (data) {
            $(".type1Area").html("");
        	$.each(data, function(idx, item){
                if(idx == 0){
                    area = item.seat_area;
                }
                $(".type1Area").append("<option value=" + item.seat_area + ">" + item.seat_area + "</option>");
            })
            drawSeat();
        }
    });
}

function drawCombobox2() {
    $.ajax({
        type: "GET",
        url: "../getArea?grade=" + grade,
        dataType: "json",
        cache: false,
        success: function (data) {
            $(".type2Area").html("");
        	$.each(data, function(idx, item){
                if(idx == 0){
                    area = item.seat_area;
                }
                $(".type2Area").append("<option value=" + item.seat_area + ">" + item.seat_area + "</option>");
            })
            drawSeat2();
        }
    });
}

function drawSeat(){
    $.ajax({
        type: "GET",
        url: "../getSeat?seat_area=" + area,
        dataType: "json",
        cache: false,
        success: function (data) {
            $("#zone").html("");
        	$.each(data, function(idx, item){
                if(item.seat_status == 1){
                    if(idx == 8 || idx == 26){
                        $("#zone").append("<input type='checkbox' name='seat' class='seat rightMargin' checked disabled value='"+item.detail_seat + "'>");    
                    }else if(idx == 17){
                        $("#zone").append("<input type='checkbox' name='seat' class='seat' checked disabled value='"+item.detail_seat + "'> <br>");
                    }else{
                        $("#zone").append("<input type='checkbox' name='seat' class='seat' checked disabled value='"+item.detail_seat + "'>");
                    }    
                }else{
                    if(idx == 8 || idx == 26){
                        $("#zone").append("<input type='checkbox' name='seat' class='seat rightMargin' value='"+item.detail_seat + "'>");    
                    }else if(idx == 17){
                        $("#zone").append("<input type='checkbox' name='seat' class='seat' value='"+item.detail_seat + "'> <br>");
                    }else{
                        $("#zone").append("<input type='checkbox' name='seat' class='seat' value='"+item.detail_seat + "'>");
                    }
                }
            })
        }
    });
}

function drawSeat2(){
    $.ajax({
        type: "GET",
        url: "../getSeat?seat_area=" + area,
        dataType: "json",
        cache: false,
        success: function (data) {
            $(".zone").html("");
            console.log("success")
        	$.each(data, function(idx, item){
                if(item.seat_status == 1){
                    if(idx == 6 || idx == 13 || idx == 20 || idx == 27){
                        $(".zone").append("<input type='checkbox' name='seat' class='seat' checked disabled value='"+item.detail_seat + "'> <br>");    
                    }else{
                        $(".zone").append("<input type='checkbox' name='seat' class='seat' checked disabled value='"+item.detail_seat + "'>");
                    }    
                }else{
                    if(idx == 6 || idx == 13 || idx == 20 || idx == 27){
                        $(".zone").append("<input type='checkbox' name='seat' class='seat' value='"+item.detail_seat + "'> <br>");    
                    }else{
                        $(".zone").append("<input type='checkbox' name='seat' class='seat' value='"+item.detail_seat + "'>");
                    }
                }
            })
        }
    });
}

function resetSeat(){
    seat_cnt = 0;
    arrSeat = [];
    $(".modal-myPickList").html(" ");
    $(".MySelect-list").html(" ");
    $("input:checkbox[name='seat']").prop("checked", false);
}