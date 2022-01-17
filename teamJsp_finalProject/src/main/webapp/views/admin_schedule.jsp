<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin_schedule.css" />

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	$(function() {
		if(${year == 133}) {
			$(".year2021").css("display", "block");
		}else if(${year == 134}) {
			$(".year2022").css("display", "block");
		}		
		
		$(".add-btn").on("click", function() {
			location.href="writeSchedule";
		})
	})
	
	function SelectCheck() {
		var ck = $(".ckBox").is(":checked");
		if(ck == false){
			alert("항목을 최소 하나 이상 선택하세요.");
			return false;	
		}else{
			return true;
		}
	}		
</script>


<div id="admin-schedule-container">
	<jsp:include page="admin_menu.jsp"></jsp:include>
	<div class="contents-box">
		<h2>스케줄 관리</h2>		
		<div class="category-info">
			<h4>- 팀 번호</h4>
			<p>1.수원KT &emsp;2.서울SK &emsp;3.안양KGC &emsp;4.고양오리온 &emsp;5.울산모비스</p>
			<p>6.대구가스공사 &emsp;7.원주DB &emsp;8.창원LG &emsp;9.전주KCC &emsp;10.서울삼성</p>
			<h4>- 경기상태</h4>
			<p>0: 경기종료 &emsp;1: 예매열림 &emsp;2: 예매닫힘</p>
			<h4>- 경기결과</h4>
			<p>0: 홈팀 승 &emsp;1: 어웨이팀 승</p>
		</div>
		<div class="year-div">
			<a href="schedule?gameno=133&select_month=10">2021</a>&emsp;&emsp;
	     	<a href="schedule?gameno=134&select_month=1">2022</a>
	     	<div class="year2021">
	     		<a href="schedule?gameno=133&select_month=10">10</a>
	     		<a href="schedule?gameno=133&select_month=11">11</a>
	     		<a href="schedule?gameno=133&select_month=12">12</a>
	     	</div>
	     	<div class="year2022">
	     		<a href="schedule?gameno=134&select_month=1">1</a>
	     		<a href="schedule?gameno=134&select_month=2">2</a>
	     		<a href="schedule?gameno=134&select_month=3">3</a>
	     	</div>
		</div>
		<form action="deleteSchedule" onsubmit="return confirm('정말 삭제하시겠습니까?')">
			<table>
				<tr>
					<th width="30"></th>
					<th width="80">경기번호</th>
					<th width="100">날짜</th>
					<th width="120">장소</th>
					<th width="100">경기상태</th>
					<th width="100">경기결과</th>
					<th width="100">홈팀</th>
					<th width="100">어웨이팀</th>
					<th width="150">스코어(어웨이:홈)</th>					
				</tr>
				
				<c:forEach var="list" items="${list}">
					<tr>
						<td><input class="ckBox" type="checkbox" name="gameno" value="${list.gameno}" /></td>
						<td><a class="game-title" href="modifySchedule?gameno=${list.gameno}">${list.gameno}</a></td>
						<td>${list.game_date}</td>
						<td>${list.game_arena}</td>
						<td>${list.game_status}</td>
						<td>${list.game_result}</td>
						<td>${list.teamno}</td>
						<td>${list.teamno2}</td>
						<td>${list.game_score}</td>
					</tr>
				</c:forEach>
				
			</table>

			<div style="text-align: right;">
				<input class="delete-btn" type="submit" value="선택 삭제" onclick="return SelectCheck()" /> 
				<input class="add-btn" type="button" value="스케줄 추가" />
			</div>
		</form>
		
		
		<div class="paging-btn">
			<ul>
				<c:if test="${map.prev}">
					<li><a href="schedule?currentPage=${map.currentPage -5}&select_month=${map.select_month}">Previous</a></li>					
				</c:if>
				
				<c:forEach begin="${map.startPageNo}" end="${map.endPageNo}" var="i">
					<li><a href="schedule?currentPage=${i}&select_month=${map.select_month}&gameno=${year}">${i}</a></li>
				</c:forEach>
				
				<c:if test="${map.next}">
						<li><a href="schedule?currentPage=${map.currentPage + 5}&select_month=${map.select_month}">Next</a></li>
				</c:if>
			</ul>
		</div>

		

	</div>




</div>


