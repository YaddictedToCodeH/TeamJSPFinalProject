<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>티켓 예매 안내사항</title>
</head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/ticketNotice.css" />
<body>
	<jsp:include page="header.jsp"></jsp:include>

    <div class="container">

        <div class="title"><h1>예매사항 안내</h1></div>

        <div class="payment">
            <div class="paymenttitle"><img src="${pageContext.request.contextPath}/resources/images/blacklogo_sm.png" alt="" class="ktlogo">결제수단안내</div>
            <div class="paymenttext">
                <p>web  신용카드, 계좌이체, 간편결제</p>
                <p class="pps">-무통장 입금은 경기일 3일전부터 결제수단이 사라지니 4일전까지만 이용 가능</p>
                <p class="pps">-휴대폰 결제는 간편걸제를 통해서만 가능</p>
            </div>      
        </div>

        <div class="cancel">
            <div class="canceltitle"><img src="${pageContext.request.contextPath}/resources/images/blacklogo_sm.png" alt="" class="ktlogo">부분취소 안내</div>
            <div class="canceltext">
                <p>신용카드 단일결제 시 부분 최소 가능</p><br>
                <p class="cps">-단, 포인트 및 쿠폰 사용시 부분취소 불가</p>
            </div>
        </div>

        <div class="common">
            <div class="commontitle"><img src="${pageContext.request.contextPath}/resources/images/blacklogo_sm.png" alt="" class="ktlogo">예매 관련 사안</div>
                 <div class="commontext">
                        <table>
                            <tr>
                                <th>예매 확인 및 취소</th>
                                <td>KBL WEB 또는 APP 통해 가능 (모바일 웹 불가)</td>
                            </tr>
                            <tr>
                                <th>예매 수수료</th>
                                <td>1,000원(장당)</td>
                            </tr>
                            <tr>
                                <th>사회적 배려층</th>
                            <td>온라인 예매 후 현장 매표소에서 증빙 서류 제출 후 티켓 발권</td>
                        </tr>
                        <tr>
                            <th>문화누리카드 결제</th>
                            <td>좌석 선택 후 권종 선택 단계에서 문화누리카드 선택 가능</td>
                        </tr>
                        <tr>
                            <th>유료멤버십</th>
                            <td>구단별 유료멤버십 중복 가입은 불가합니다.</td>
                        </tr>
                    </table>
                    <p class="ps">-사회적 배려층: 장애인/경로/국가유공자</p>
                    <p class="ps">-문화누리카드 결제 기능 좌석은 다를 수 있음 </p>
            </div>
        </div>

        <div class="cs">
            <div class="cstitle"><img src="${pageContext.request.contextPath}/resources/images/blacklogo_sm.png" alt="" class="ktlogo">고객센터</div>
             <div class="cstext">
                    <p>티켓 예매 및 취소  1588-7890 (운영시간: 10:00~18:00)</p>
                    <p>기타 문의 전화  1588-4567 (운영시간: 10:00~18:00)</p>

                    <p class="csps">- 전화 연결이 안될 경우 membership@ticketlink.co.kr </p>
              </div>
        </div>

    </div>
	
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>