<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/payment.css" />
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/payment.js"></script>
<jsp:include page="./header.jsp"></jsp:include>

<div id="payment-container">
        <div id="ticketing-title"><h2>예매하기</h2></div>

        <div id="ticketing-step">
            <span>구역 / 좌석 선택</span> > <span>할인적용</span>  > <span>예매확인</span> > <span class="active">결제완료</span>
        </div>

        <div id="payment-status"><span>결제가 완료되었습니다.</span></div>
        
        <div id="ticketInfo">
            <div class="ticketInfo-header">
                <span>수원 KT 프로농구단 예매권</span>
                <span>${game_date}</span>
            </div>
            <div class="ticketInfo-game">
                <div class="team"><span>${team_name}</span><div><img src="${pageContext.request.contextPath}${team_logo}" alt=""></div></div>
                <span>VS</span>
                <div class="team"><span>${team_name2}</span><div><img src="${pageContext.request.contextPath}${team_logo2}" alt=""></div></div>
            </div>

            <div id="reserveInfo">
                <table>
                    <tr>
                        <td>예매번호</td>
                        <td>${resv_number}</td>
                    </tr>
                    <tr>
                        <td>경기일시</td>
                        <td>${game_date }</td>
                    </tr>
                    <tr>
                        <td>경기장소</td>
                        <td>${game_arena }</td>
                    </tr>
                    <tr>
                        <td>예매좌석</td>
                        <td>
                        	<c:forEach items="${detail_seat}" var="list">
                        		<p>${grade} ${area} ${list}</p>
                        	</c:forEach>
                        </td>
                    </tr>
                    <tr>
                        <td>티켓수령방법</td>
                        <td>현장발권</td>
                    </tr>
                    <tr>
                        <td>취소수수료</td>
                        <td>티켓 금액의 10%</td>
                    </tr>
                    <tr>
                        <td>예약자 휴대전화</td>
                        <td>${mp}</td>
                    </tr>
                </table>
            </div>
        </div>

        <div id="payment-status"><span>KT 수원 프로농구단 예매를 이용해주셔서 감사합니다.</span></div>

        <div id="paymentOk-btnList">
            <input type="button" value="홈으로 이동" class="paymentOk-btn">
            <input type="button" value="예매내역확인" class="paymentOk-btn">
        </div>

    </div>

<jsp:include page="./footer.jsp"></jsp:include>