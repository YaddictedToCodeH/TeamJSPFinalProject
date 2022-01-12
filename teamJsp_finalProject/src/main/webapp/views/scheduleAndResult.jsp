<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="./resources/css/scheduleAndResult.css" />
<title>일정 및 결과</title>


<jsp:include page="./header.jsp" />

<div id="schedule_container">
	<div class="tema">
		<h2>일정 및 결과</h2>
		<p>경기 일정 및 결과를 확인할 수 있습니다.</p>
		<div id="tema_foot">
			<p>시즌경기 <span> 정규시즌</span></p>
		</div>
	</div>

	<div class="schedule-controller">	
		<a href="schedule?gameno=133">2021</a>&emsp;&emsp;
		<a href="schedule?gameno=134&select_month=1">2022</a>
		
		<div>
			<form action="" method="get">
			<select name="select_month" class="options">
				<optgroup label="월 선택">
					<option value="12">12</option>
					<option value="11">11</option>
					<option value="10">10</option>
					<option value="9">9</option>
					<option value="8">8</option>
					<option value="7">7</option>
					<option value="6">6</option>
					<option value="5">5</option>
					<option value="4">4</option>
					<option value="3">3</option>
					<option value="2">2</option>
					<option value="1">1</option>
				</optgroup>
			</select>
			<input type="hidden" name="gameno" value="${month.gameno}" />
			<input type="submit" value="조회" />
			</form>
		</div>
		
	</div>

	<table class="game-schedule-list">
		<thead>
			<tr>
				<th style="width: 100px;" >날짜</th>
				<th style="width:550px; height:60px;">경기 (어웨이 : 홈) 스코어</th>
				<th style="width: 150px;">장소</th>
				<th style="width: 200px;">결과</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="list" items="${list}">
				<tr>			
					<td>
					<c:if test="${list.gameno lt 134 }">
						${list.game_date}
					</c:if>
					<c:if test="${list.gameno gt 133}">
						22-${list.game_date}
					</c:if>
					</td>
					
					
					<td height="80px;" style="position: relative; bottom: 10px;">
							${list.team_name2} <img src="${list.team_logo2}" alt="" />
							<c:if test="${list.game_score ne null}">
							 	<b>${list.game_score}</b>			
							</c:if>
							<c:if test="${list.game_score eq null}">
							 	<b>VS</b>			
							</c:if>							
							<img src="${list.team_logo}" alt="" /> ${list.team_name} 
					</td>
					
					
					<td>${list.game_arena}</td>
					
					
					<td>
						<c:if test="${list.game_result eq 1 }">
							${list.team_name} 승
						</c:if>
						<c:if test="${list.game_result eq 0 }">
							${list.team_name2} 승
						</c:if>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>



</div>

<jsp:include page="./footer.jsp" />
