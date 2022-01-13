<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>티켓 가격</title>
</head>
<style>
    *{
        margin: 0;
		padding: 0;
		text-decoration: none;
		margin: 0px auto;
    }

    .container{
        width: 1000px;
        margin: 0 auto;
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    .title{
        padding: 30px;
    }

    .seating{
        border: 1px solid black;
        padding: 10px;
        width:580px;
    }

    body > div.container > div.seat > div.seatimg > img{
        width: 600px;
    }

    .pricetitle{
        border: 1px solid black;
        padding: 10px;
    }


    .pricedata{
        margin-top: 10px;
        border-collapse: collapse;
    }

    .pricedata> tr, th, td{
        border: 1px solid gray;
        padding: 10px;
    }

    .notice{
        margin-top: 30px;
        margin-bottom: 30px;
        width:610px; 
    }

    .noticetitle{
        border: 1px solid black;
        padding: 10px;
    }

</style>
<body>
	<jsp:include page="header.jsp"></jsp:include>

	<div class="container">
        <div class="title"><h1>티켓가격</h1></div>
        
        <div class="seat">
            <div class="seating">좌석배치도</div>
            <div class="seatimg"><img src="./resources/images/kt_ticket.png" alt=""></div>
        </div>

        <div class="price">
            <div class="pricetitle">21-22 티켓가격&할인정책</div>
            <table class="pricedata">
                <tr>
                    <th>구분</th>
                    <th>섹션명</th>
                    <th>티켓가격</th>
                    <th>구매혜택</th>
                    <th>비고</th>
                </tr>
                <tr>
                    <td>1층</td>
                    <td>1층 코트사이드 좌석</td>
                    <td>A1-33</td>
                    <td>쿠폰제공</td>
                    <td>선수단과 사진 촬영은 제한</td>
                </tr>
                <tr>
                    <td>1층</td>
                    <td>1층 코트사이드 좌석</td>
                    <td>A1-33</td>
                    <td>쿠폰제공</td>
                    <td>선수단과 사진 촬영은 제한</td>
                </tr>
                <tr>
                    <td>1층</td>
                    <td>1층 코트사이드 좌석</td>
                    <td>A1-33</td>
                    <td>쿠폰제공</td>
                    <td>선수단과 사진 촬영은 제한</td>
                </tr>
            </table>
        </div>

        <div class="notice">
            <div class="noticetitle">안내사항&취소 환불정책</div>
            <div class="policy">
         
                    <li>거리두기 단계에 따라, 관중 수용률 조정 <br>(1단계 -50%, 2단계 -30%, 3단계-20%, 4단계 무관중</li>
                    <li>사회적 배려 할인(장애인, 경로, 국가유공자): 일반석 본인 50%할인  <br>- 증빙서류 제출 필수</li>
                    <li>경기 3일전 오후 2시 티켓 예매 오픈,  <br>코로나 19로 티켓 오픈 일정은 변경될 수 있습니다</li>
                    <li>일반석 중 일부 구역은 전광판으로 인해 시야가 일부 방해됩니다</li>
        
                    <li>온라인 구매 티켓은 경기 시작 1시간 30분전까지 온라인을 통해 취소/환불 가능
                        <br>(경기 당일 현장 매표소에소 취소/환불 불가)
                    </li>
                    <li>경기장 입장 후 티켓 교환 및 환불 불가</li>
                    <li>취소수수료 10%(단, 예매 당일 취소시 취소 수수료 면제)</li>
                </ul>
            </div>
        </div>
    </div>
    
     <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>