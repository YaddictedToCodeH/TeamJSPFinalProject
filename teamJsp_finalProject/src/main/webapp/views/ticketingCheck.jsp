<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/ticketingCheck.css" />
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/ticketingCheck.js"></script>
<jsp:include page="./header.jsp"></jsp:include>

<div id="ticketingCheck-container">
	<form action="payment" name="payment" method="GET">
		<input type="hidden" name="game_date" value="${game_date }"/>
		<input type="hidden" name="game_arena" value="${game_arena }"/>
		<input type="hidden" name="team_name" value="${team_name }"/>
		<input type="hidden" name="team_name2" value="${team_name2 }"/>
		<input type="hidden" name="team_logo" value="${team_logo }"/>
		<input type="hidden" name="team_logo2" value="${team_logo2 }"/>
		<input type="hidden" name="grade" value="${grade }"/>
		<input type="hidden" name="area" value="${area }"/>
		<input type="hidden" name="detail_seat" value= '${detail_seat}' />
		<input type="hidden" name="usePoint_price"  value= ${usePoint_price }/>
		<input type="hidden" name="usePoint" value=${usePoint }/>	
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />					
	</form>
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

	<span class="nextStep">완료</span>

</div>

<jsp:include page="./footer.jsp"></jsp:include>