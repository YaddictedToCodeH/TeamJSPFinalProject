<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="" />
<jsp:include page="./header.jsp"></jsp:include>

<div id="saleTicket-container">
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
					<td><input type="button" value="쿠폰 적용" class="apply-btn"></td>
				</tr>
				<tr>
					<td><span>포인트 사용</span></td>
					<td><input type="text" name="" id="" class="saleOption"><span>P</span></td>
					<td><input type="button" value="포인트 적용" class="apply-btn"></td>
				</tr>
				<tr>
					<td></td>
					<td class="holdPoint"><span>(1800P)보유</span></td>
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
					<td><span>상품금액</span></td>
					<td><span>28,000 원</span></td>
				</tr>
				<tr>
					<td><span>쿠폰 할인</span></td>
					<td><span>(-) 2800 원</span></td>
				</tr>
				<tr>
					<td><span>포인트 사용</span></td>
					<td><span>(-) 1000 P</span></td>
				</tr>
				<tr>
					<td colspan="2"><hr></td>
				</tr>
				<tr>
					<td><span>총 결제금액</span></td>
					<td><span>24,200 원</span></td>
				</tr>
			</table>
		</div>
	</div>

	<a href="" class="nextStep"><span>완료</span></a>
</div>

<jsp:include page="./footer.jsp"></jsp:include>