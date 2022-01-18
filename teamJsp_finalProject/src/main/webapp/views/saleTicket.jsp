<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/saleTicket.css" />
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/saleTicket.js"></script>
<jsp:include page="./header.jsp"></jsp:include>

<div id="saleTicket-container">
	<form action="ticketingCheck" name="TicketingCheck" method="GET">
		<input type="hidden" name="game_date" value="${game_date }"/>
		<input type="hidden" name="game_arena" value="${game_arena }"/>
		<input type="hidden" name="team_name" value="${team_name }"/>
		<input type="hidden" name="team_name2" value="${team_name2 }"/>
		<input type="hidden" name="team_logo" value="${team_logo }"/>
		<input type="hidden" name="team_logo2" value="${team_logo2 }"/>
		<input type="hidden" name="grade" value="${grade }"/>
		<input type="hidden" name="area" value="${area }"/>
		<input type="hidden" name="detail_seat" value= '${arrSeat}' />
		<input type="hidden" name="usePoint_price"  />
		<input type="hidden" name="usePoint" />	
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />					
	</form>
	<div id="ticketing-title">
		<h2>예매하기</h2>
	</div>

	<div id="ticketing-step">
		<span>구역 / 좌석 선택</span> > <span class="active">할인적용</span> > <span>예매확인</span>
		> <span>결제완료</span>
	</div>

	<div id="saleTicket-apply">
		<div class="apply-div">
			<span class="divTitle">할인 적용</span>
			<table class="apply-table">
				<tr>
					<td><span>할인쿠폰</span></td>
					<td><select name="coupon" class="saleOption">
							<option value="선택" selected="selected">---------------선택---------------</option>
					</select></td>
					<td><input type="button" value="쿠폰 적용" class="coupon-btn apply-btn"></td>
				</tr>
				<tr>
					<td><span>포인트 사용</span></td>
					<td><input type="text" name="" id="point" class="saleOption"><span>P</span></td>
					<td><input type="button" value="포인트 적용" class="point-btn apply-btn"></td>
				</tr>
				<tr>
					<td><input type="hidden" id="myPoint"  value="${mem_point }" /></td>
					<td class="holdPoint"><span>(${mem_point }P)보유</span></td>
					<td></td>
				</tr>
			</table>
		</div>
	</div>

	<div id="saleTicket-payment">
		<div class="payment-div">
			<span class="divTitle">결제 금액</span>
			<table class="payment-table">
				<tr>
					<td><span>상품금액</span><input type="hidden" id="total_price" value="${total_price }" /></td>
					<td><span>${total_price} 원</span></td>
				</tr>
				<tr>
					<td><span>쿠폰 할인</span></td>
					<td><span>(-) 0 원</span></td>
				</tr>
				<tr>
					<td><span>포인트 사용</span></td>
					<td><span class="usePoint">(-) 0 P</span></td>
				</tr>
				<tr>
					<td colspan="2"><hr></td>
				</tr>
				<tr>
					<td><span>총 결제금액</span></td>
					<td><span class="usePoint_price"></span></td>
				</tr>
			</table>
		</div>
	</div>

	<span class="nextStep">완료</span>
</div>

<jsp:include page="./footer.jsp"></jsp:include>