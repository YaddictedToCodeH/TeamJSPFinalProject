<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin_galleryForm.css" />

 <script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	function SelectCheck(){
		var gdate = $("input[name=game_date]").val();
		var garena = $("input[name=game_arena]").val();
		var gt = $("input[name=teamno]").val();
		var gt2 = $("input[name=teamno2]").val();
		var gstatus = $("input[name=game_status]").val();
		if(gdate == '' || garena == '' || gt == '' || gt2 == '' || gstatus == '') {
			alert("날짜, 경기장, 홈팀, 어웨이팀, 상태는 공백이 있으면 안됩니다.");			
			return false;
		}else{
			return true;
		}
	}
</script>

<div id="adg-container">
	<jsp:include page="admin_menu.jsp"></jsp:include>
	   <div class="contents-box">
		<h2>갤러리 추가</h2>		
		<div class="category-info">
			<h4>-팀 번호</h4>
			<p>1.수원KT &emsp;2.서울SK &emsp;3.안양KGC &emsp;4.고양오리온 &emsp;5.울산모비스</p>
			<p>6.대구가스공사 &emsp;7.원주DB &emsp;8.창원LG &emsp;9.전주KCC &emsp;10.서울삼성</p>
			<h4>경기상태</h4>
			<p>0: 경기종료 &emsp;1: 예매열림 &emsp;2: 예매닫힘</p>
			<h4>경기결과</h4>
			<p>0: 홈팀 승 &emsp;1: 어웨이팀 승</p>
		</div>
		
		
	<form action="writeSchedule" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		<table>
			<tr>
				<th>경기 날짜</th>
				<td><input type="text" name="game_date"/></td>
			</tr>
			<tr>
				<th>경기장</th>
				<td><input type="text" name="game_arena"/></td>
			</tr>
			<tr>
				<th>홈팀</th>
				<td><input type="text" name="teamno"/></td>
			</tr>	
			<tr>
				<th>어웨이팀</th>
				<td><input type="text" name="teamno2" /></td>
			</tr>
			<tr>
				<th>스코어(어웨이:홈)</th>
				<td><input type="text" name="game_score" /></td>		
			</tr>
			<tr>
				<th>경기 상태</th>
				<td><input type="text" name="game_status"/></td>
			</tr>
			<tr>
				<th>경기 결과</th>
				<td><input type="text" name="game_result"/></td>
			</tr>
			<tr>
				<td colspan="2">
					<button class="btn"><a href="schedule">목록으로</a></button>
					<input class="btn" type="submit" value="추가하기" onclick=" return SelectCheck()"/>					
				</td>
			</tr>
		</table>
	</form>
	</div>
</div>    