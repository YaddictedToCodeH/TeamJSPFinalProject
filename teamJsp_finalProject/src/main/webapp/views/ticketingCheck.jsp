<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/ticketingCheck.css" />
<jsp:include page="./header.jsp"></jsp:include>

<div id="ticketingCheck-container">
	<div id="ticketing-title">
		<h2>예매하기</h2>
	</div>

	<div id="ticketing-step">
		<span>구역 / 좌석 선택</span> > <span>할인적용</span> > <span class="active">예매확인</span>
		> <span>결제완료</span>
	</div>

	<div id="ticketingCheck-reservation">
		<div class="reservation-div">
			<span class="divTitle">예약자 정보</span>
			<table class="reservation-table">
				<tr>
					<td><span>예약자 이름</span></td>
					<td><span>${dto.mem_name }</span></td>
				</tr>
				<tr>
					<td><span>이메일</span></td>
					<td><span>${dto.mail }</span></td>
				</tr>
				<tr>
					<td><span>휴대 전화</span></td>
					<td><span>${dto.mp }</span></td>
				</tr>
			</table>
		</div>
	</div>

	<div id="ticketingCheck-reservation">
		<div class="reservation-div">
			<span class="divTitle">예약 정보</span>
			<table class="reservation-table">
				<tr>
					<td><span>경기</span></td>
					<td><span>${team_name } VS ${team_name2 }</span></td>
				</tr>
				<tr>
					<td><span>경기 일자</span></td>
					<td><span>${game_date }</span></td>
				</tr>
				<tr>
					<td><span>선택 좌석</span></td>
					<td>
						<div class="modal-myPickList">
							<c:forEach items="${detail_seat}" var="list">
								<p>${grade} ${area} ${list}</p>							
							</c:forEach>
						</div>
					</td>
				</tr>
				<tr>
					<td><span>총 결제 금액</span></td>
					<td><span>${usePoint_price} 원</span></td>
				</tr>
			</table>
		</div>
	</div>

	<a href="" class="nextStep"><span>완료</span></a>

</div>

<jsp:include page="./footer.jsp"></jsp:include>