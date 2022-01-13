<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="./resources/css/rank_player.css" />

<meta charset="UTF-8">
<title>KT 선수 순위</title>

<jsp:include page="./header.jsp" />


<div id="rank-container">
	<div class="tema">
		<h2>KT 선수 순위</h2>
		<p>모든 KT선수의 순위를 확인 하실 수 있습니다.</p>
		
		<div id="tema_foot">
			<p>정규경기 <span>2021 - 2022</span></p>
		</div>
	</div>
	<div class="rank-label"></div>
	<table class="allRank-table">
		<tr>
			<th>순위</th>
			<th>선수명</th>
			<th>경기</th>
			<th>평균출전시간</th>
			<th>득점합계</th>
			<th>득점평균</th>
			<th>리바합계</th>
			<th>리바평균</th>
			<th>어시합계</th>
			<th>어시평균</th>
		</tr>
		<c:forEach var="list" items="${list}">
			<tr>
				<td>${list.rn}</td>
				<td>${list.player_name}</td>
				<td>${list.gameCount}</td>
				<td><fmt:formatNumber value="${list.avg_min}" pattern="00.00"></fmt:formatNumber></td>
				<td>${list.sum_pts}</td>
				<td><fmt:formatNumber value="${list.avg_pts}" pattern="00.00"></fmt:formatNumber></td>
				<td>${list.sum_reb}</td>
				<td><fmt:formatNumber value="${list.avg_reb}" pattern="00.00"></fmt:formatNumber></td>
				<td>${list.sum_ast}</td>
				<td><fmt:formatNumber value="${list.avg_ast}" pattern="00.00"></fmt:formatNumber></td>
			</tr>
		</c:forEach>
	</table>	
	
</div>


<jsp:include page="./footer.jsp" />
