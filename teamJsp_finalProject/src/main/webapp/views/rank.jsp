<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="./resources/js/rank.js"></script>

<link rel="stylesheet" href="./resources/css/rank.css" />

<title>KT 팀/선수 순위</title>

<jsp:include page="./header.jsp" />


<div id="rank-container">
	<div class="tema">
		<h2>KT 팀 / 선수 순위</h2>
		<p>팀, 선수 순위를 확인 하실 수 있습니다.</p>
		
		<div id="tema_foot">
			<p>정규경기 <span>2021 - 2022</span></p>
		</div>
	</div>

	<div class="rank-label">KBL 팀 순위</div>
	<table class="rank-table">
		<tr>
			<th>순위</th>
			<th>팀</th>
			<th>경기</th>
			<th>승</th>
			<th>패</th>
			<th>승률</th>
		</tr>
		<c:forEach var="list" items="${list}">
			<tr>
				<td>${list.teamno}</td>
				<td>${list.team_name}</td>
				<td>${list.gameCount}</td>
				<td>${list.win}</td>
				<td>${list.lose}</td>
				<td><fmt:formatNumber value="${list.winRate}" pattern="0.000">
				</fmt:formatNumber></td>
			</tr>
		</c:forEach>
	</table>
	
	<div class="rank-label">KT 선수 순위</div>
	
	<div class="player-div">
			<div class="player-div-title">
				<h3>득점</h3>
				<div><a href="recordingroom">순위 더 보기 ></a></div>				
			</div>
			<div class="player-div-body">
				<div>
					<img width="165px;" height="200px;" src="${pst_list[0].player_img}" alt="player_img"/>
					<img width="45px;" height="40px;" src="./resources/images/TeamLogo/teamLogo_KT.png" style="position: absolute; right: 10px;" />
					<span class="record-1st">1st</span>
					<span class="player-name"><a href="playerDetail?player_backno=${pst_list[0].player_backno}">${pst_list[0].player_name}</a></span>
					<span class="team-name">${list[0].team_name}</span>
					<span class="player-record">기록: ${pst_list[0].player_pts}</span>
				</div>
			<c:forEach begin="1" end="4" var="i">
				<div class="player-div-footer">
					<div class="number-color"><span>${pst_list[i].rn}</span></div>
					<span class="sub-player-name"><a href="playerDetail?player_backno=${pst_list[i].player_backno}">${pst_list[i].player_name}</a></span> 
					<span class="right-record"><fmt:formatNumber value="${pst_list[i].player_pts}" pattern="0.00"></fmt:formatNumber></span>
				</div>
			</c:forEach>										
			</div>
	</div>
	
	<div class="player-div">
			<div class="player-div-title">
				<h3>리바운드</h3>
				<div><a href="recordingroom">순위 더 보기 ></a></div>
			</div>
			<div class="player-div-body">
				<div>
					<img width="165px;" height="200px;" src="${reb_list[0].player_img}" alt="player_img"/>
					<img width="45px;" height="40px;" src="./resources/images/TeamLogo/teamLogo_KT.png" style="position: absolute; right: 10px;" />
					<span class="record-1st">1st</span>
					<span class="player-name"><a href="playerDetail?player_backno=${reb_list[0].player_backno}">${reb_list[0].player_name}</a></span>
					<span class="team-name">${list[0].team_name}</span>
					<span class="player-record">기록: ${reb_list[0].player_reb}</span>
				</div>
			<c:forEach begin="1" end="4" var="i">
				<div class="player-div-footer">
					<div class="number-color"><span>${reb_list[i].rn}</span></div>
					<span class="sub-player-name"><a href="playerDetail?player_backno=${reb_list[i].player_backno}">${reb_list[i].player_name}</a></span> 
					<span class="right-record"><fmt:formatNumber value="${reb_list[i].player_reb}" pattern="0.00"></fmt:formatNumber></span>					
				</div>
			</c:forEach>										
			</div>
	</div>
	
	<div class="player-div">
			<div class="player-div-title">
				<h3>어시스트</h3>
				<div><a href="recordingroom">순위 더 보기 ></a></div>
			</div>
			<div class="player-div-body">
				<div>
					<img width="165px;" height="200px;" src="${ast_list[0].player_img}" alt="player_img"/>
					<img width="45px;" height="40px;" src="./resources/images/TeamLogo/teamLogo_KT.png" style="position: absolute; right: 10px;" />
					<span class="record-1st">1st</span>
					<span class="player-name"><a href="playerDetail?player_backno=${ast_list[0].player_backno}">${ast_list[0].player_name}</a></span>
					<span class="team-name">${list[0].team_name}</span>
					<span class="player-record">기록: ${ast_list[0].player_ast}</span>
				</div>
			<c:forEach begin="1" end="4" var="i">				
				<div class="player-div-footer">
					<div class="number-color"><span>${ast_list[i].rn}</span></div>
					<span class="sub-player-name"><a href="playerDetail?player_backno=${ast_list[i].player_backno}">${ast_list[i].player_name}</a></span> 
					<span class="right-record"><fmt:formatNumber value="${ast_list[i].player_ast}" pattern="0.00"></fmt:formatNumber></span>				
				</div>
			</c:forEach>										
			</div>
	</div>
	
	
	<!-- (clear:both용)-->
	<div class="clearfixed"></div>			
	
</div>


<jsp:include page="./footer.jsp" />

