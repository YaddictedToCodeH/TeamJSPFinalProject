<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="now" class="java.util.Date" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/ticketing.css" />

<jsp:include page="./header.jsp"></jsp:include>

<div id="ticketing-container">
	<div id="ticketing-title">
		<h2>예매하기</h2>
	</div>

	<div id="ticketing-info">
		<div class="info-wrap">
			<ul class="ticketInfo1">
				<li>경기 입장시간 : 경기시작 2시간 전</li>
				<li>매표소 운영시간 : 경기시작 2시간 전 ~ 3쿼터 종료시점</li>
				<li>예매 가능 일시 : 경기 2일 전 ~ 경기시작 시간까지 (예매취소는 시간제한 없이 10% 수수료 부과)</li>
			</ul>
			<hr>
			<ul class="ticketInfo2">
				<li>-&nbsp; 정확한 역학조사를 위해 1인1티켓소지 후 입장 가능합니다</li>
				<li>-&nbsp; 코로나 19 대응 지침에 따라 전 좌석 예매로 판매하며 현장판매는 진행 하지않습니다</li>
				<li>-&nbsp; 사회적 거리두기 방침에 따라 1층 플로어석은 운영 하지 않습니다</li>
				<li>-&nbsp; 사회적 거리두기 기간 동안 전 좌석 미취학 아동 무료 입장 불가 (좌석 필요 시 예매,
					현장에서 추가 구매 불가)</li>
				<li>-&nbsp; 코로나 19 방역 수칙에 따라 경기장내에 음식물 반입금지 (음료섭취는 가능)</li>
				<li>-&nbsp; 휠체어 탑승 장애인의 경우 일반석 좌석을 '경로,장애,유공' 권종으로 예매 후 현장
					매표소에서 교환 / 경기장 내에서 휠체어석으로 안내 받으실 수 있습니다.</li>
				<br>
				<li>-&nbsp; 포인트는 결제건에 대해 등급별로 결제 금액에 n%로 지급 (일반회원 1%, 패밀리 2%,
					실버 4%, 골드 6%, VIP 8%)</li>
			</ul>
		</div>
	</div>

	<div id="game-list-wrap">
		<div id="game-list">
			<div class="game-title">
				<h4>&nbsp;홈 경기</h4>
			</div>
			<table class="game-table">
				<tr>
					<th>날짜</th>
					<th>경기</th>
					<th>장소</th>
					<th></th>
				</tr>
				<fmt:formatDate value="${now}" pattern="MM.DD HH:mm" var="nowDate" /> 
				<c:forEach var="list" items="${list1}">
				<tr>
					<td>${list.game_date }</td>
					<td>
					<img src="${pageContext.request.contextPath}${list.team_logo}" alt="" class="teamLogoImg">
					 ${list.team_name} &nbsp;VS&nbsp; ${list.team_name2 } 
					 <img src="${pageContext.request.contextPath}${list.team_logo2}" alt="" class="teamLogoImg">
					</td>
					<td>${list.game_arena}</td>
					<c:if test="${nowDate > list.game_date2 }">
						<td>
							<a href="<c:url value="/member/selectArea?game_date=${list.game_date}&game_arena=${list.game_arena}
													&team_name=${list.team_name}&team_name2=${list.team_name2}&team_logo=${list.team_logo}
													&team_logo2=${list.team_logo2}" />">
							<input type="button" value="예매하기" class="ticketOk"></a>
						</td>															
					</c:if>
					<c:if test="${nowDate <= list.game_date2 }">
						<td>${list.game_date2 } 오픈</td>															
					</c:if>
				</tr>
				</c:forEach>
			</table>
		</div>
		<div id="game-list">
			<div class="game-title">
				<h4>&nbsp;원정 경기</h4>
			</div>
			<table class="game-table">
				<tr>
					<th>날짜</th>
					<th>경기</th>
					<th>장소</th>
					<th></th>
				</tr>
				<c:forEach var="list" items="${list2}">
				<tr>
					<td>${list.game_date }</td>
					<td>
					<img src="${pageContext.request.contextPath}${list.team_logo}" alt="" class="teamLogoImg">
					 ${list.team_name} &nbsp;VS&nbsp; ${list.team_name2 } 
					 <img src="${pageContext.request.contextPath}${list.team_logo2}" alt="" class="teamLogoImg">
					</td>
					<td>${list.game_arena}</td>
					<c:if test="${nowDate > list.game_date2 }">
						<td><input type="button" value="예매하기" class="ticketOk"></td>															
					</c:if>
					<c:if test="${nowDate <= list.game_date2 }">
						<td>${list.game_date2 } 오픈</td>															
					</c:if>					
				</tr>
				</c:forEach>
			</table>
		</div>
	</div>

</div>


<jsp:include page="./footer.jsp"></jsp:include>