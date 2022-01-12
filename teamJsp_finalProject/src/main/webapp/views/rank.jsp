<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<link rel="stylesheet" href="./resources/css/rank.css" />

<title>KT 팀/선수 순위</title>

<jsp:include page="./header.jsp" />

<div id="rank-container">
	<div class="tema">
		<h2>KT 팀 / 선수 순위</h2>
		
		<div id="tema_foot">
			<p>정규경기 <span>2021 - 2022</span></p>
		</div>
	</div>

	<div class="rank-label">팀 순위</div>
	<table class="rank-table">
		<tr>
			<th>순위</th>
			<th>팀</th>
			<th>승</th>
			<th>패</th>
			<th>승률</th>
		</tr>
		<c:forEach var="list" items="${list}">
			<tr>
				<td>${list.teamno}</td>
				<td>${list.team_name}</td>
				<td>${list.win}</td>
				<td>${list.lose}</td>
				<td><fmt:formatNumber value="${list.winRate}" pattern="0.000">
				</fmt:formatNumber></td>
			</tr>
		</c:forEach>
	</table>
	
	
	
	
	<div class="rank-label">선수 순위</div>
	
	<div class="player-div">
			<div class="player-div-title">
				<h3>득점</h3>
				<a href="">순위 더 보기▶</a>				
			</div>
			<div class="player-div-body">
				<div>
					<img width="120px;" height="130px;" src="${list2[0].player_img}" alt="player_img" />
					${list2[0].player_name}
				</div>
						
					
			</div>
	</div>
	
</div>


<jsp:include page="./footer.jsp" />

