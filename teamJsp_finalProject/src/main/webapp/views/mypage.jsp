<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	$(document).ready(function() {
	//ul -> tabs -> li에 있는 걸 클릭하면
		$('ul.tabs1 li').click(function() {
			var tab_id = $(this).attr('data-tab');
	//현페이지가 사라지고
			$('ul.tabs1 li').removeClass('current');
			$('.tab-content').removeClass('current');
	//클릭한 페이지가 생긴다. ? 
			$(this).addClass('current');
			$("#" + tab_id).addClass('current');
		})

	});
	$(document).ready(function() {
	//ul -> tabs -> li에 있는 걸 클릭하면
		$('ul.tabs2 li').click(function() {
			var tab_id = $(this).attr('data-tab');
	//현페이지가 사라지고
			$('ul.tabs2 li').removeClass('current');
			$('.tab-content').removeClass('current');
	//클릭한 페이지가 생긴다. ? 
			$(this).addClass('current');
			$("#" + tab_id).addClass('current');
		})

	});
</script>
<style>
/*메인크기*/
.sw-introduce {
	border: solid 1px black;
	height: 1200px;
	width: 1200px;
	margin: 0 auto;
	text-align: center;
	background-color: #D3D3D3;
}


/*탭 사이즈*/
ul.tabs1 {
	margin: 40px 0px 40px 0px;
	padding: 0px;
	list-style: none;
	
}

/*탭 버튼 설정*/
ul.tabs1 li {
	display: inline-block;
	color: white;
	padding: 10px 15px;
	cursor: pointer;
	width:300px;
	height: 100px;
	background: #DE1313;
	border-radius: 25px;
	margin: 35px 0px 35px 35px;
}
/*누르는 색*/
ul.tabs1 li.current {
	color: #222;
}

/* 이거없으면 탭 기능상실 */
.tab-content {
	display: none;
	padding: 12px;
}
/* 이거없으면 모든 게시글 사라짐 */
.tab-content.current {
	display: inherit;
}
.mypage_class{
	width: 970px;
	height: 100px;
	background: white;
	border: solid 1px white;
	border-radius: 15px;
	position: relative;
	left: 115px;
	margin: 30px 0px 30px 0px;
}
.minilogo{
	width: 70px;
	height: 60px;
}
.user_table{
	width: 1180px;
	height: 480px;
	margin: 0 auto;
	font-weight: bolder;
	border-spacing: 14px;
}
.user_table2{
	width: 1180px;
	height: 480px;
	margin: 0 auto;
	font-weight: bolder;
	border-spacing: 14px;
}


.user_table th{
	background: white;
	border: solid 4px black;
	border-radius: 15px;
	margin: 25px 25px;
	color: white;
}
.user_table2 th{
	background: white;
	border: solid 4px black;
	border-radius: 15px;
	margin: 25px 25px;
	color: white;
}

.user_table a{
	text-decoration: none;
	color: #2D2DC7;
}
.user_table2 a{
	text-decoration: none;
	color: black;
}
.point_class a{
	text-decoration: none;
	color: black;
}
.imformation_class a{
	text-decoration: none;
	color: black;
}
.ticket_class a{
	text-decoration: none;
	color: black;
}
.back_class a{
	text-decoration: none;
	color: black;
}
.pagination{
	list-style:none;
}
.pagination button{
	width: 100px;
	height: 50px;
	border-radius: 15px;
	text-decoration: none;
	background: white;
	font-weight: bolder;
}
.user_table button{
	width: 200px;
	height: 50px;
	border-radius: 15px;
	text-decoration: none;
	background: white;
	font-weight: bolder;
	
}
.point_class button{
	width: 300px;
	height: 80px;
	border-radius: 15px;
	text-decoration: none;
	background: white;
	font-weight: bolder;
}
.imformation_class button{
	width: 300px;
	height: 80px;
	border-radius: 15px;
	text-decoration: none;
	background: white;
	font-weight: bolder;
}
.ticket_class button{
	width: 300px;
	height: 80px;
	border-radius: 15px;
	text-decoration: none;
	background: white;
	font-weight: bolder;
}
.back_class button{
	width: 300px;
	height: 80px;
	border-radius: 15px;
	text-decoration: none;
	background: white;
	font-weight: bolder;
}
</style>
</head>
<body>
<div class="sw-introduce">
		<div class="mypage_class">
			<h1>
				<img class="minilogo" src="../resources/images/kt-emblem-img.png" />마이페이지
			</h1>
		</div>
		<ul class="tabs1">
			<li data-tab="tab-1"><h1><sec:authentication property="name"/>님의 문의 내역</h1></li>
			<li data-tab="tab-2"><h1>포인트</h1></li>
			<li data-tab="tab-3"><h1>개인 정보 관리</h1></li>
			<li data-tab="tab-4"><h1>티켓 예매 내역</h1></li>
			<li data-tab="tab-5"><h1>돌아가기</h1></li>
		</ul>

		<!-- 사용자 첫화면 -->
		<!------------------------------------------------------------------------------------------------------------------------------------->		
		<div id="tab-1" class="tab-content current">
			<table class="user_table">
				<tr>
					<td colspan="4">
						<button ><a href="write" style="color: black">문의 내역 작성하러 가기</a></button>
					</td>
				</tr>
				<tr>
					<th style="background:black">게시물번호</th>
					<th style="background:black">작성자</th>
					<th style="background:black">제목</th>
					<th style="background:black">작성일시</th>
				</tr>
				
				<c:forEach var="dto" items="${list }">
					<tr>
						<th style="color:black">${dto.inqno }</th>
						<th style="color:black">${dto.id }</th>
						<th><a href="detail?inqno=${dto.inqno}" style="text-decoration:none">${dto.inq_title }</a></th>
						<th style="color:black">${dto.inq_date }</th>
					</tr>
				</c:forEach>

				<tr>
					<td colspan="4">
					<nav aria-label="Page navigation example">
						<ul class="pagination">
							<c:if test="${map.prev}">
								<li><button  style="color: black; width:50px; height:50px"><a href="mypage?currentPage=${map.currentPage-5}">Previous</a></button></li>
							</c:if>
							<c:forEach var="i" begin="${map.startPageNo }" end="${map.endPageNo }">
								<li><button  style="color: black; width:50px; height:50px"><a href="mypage?currentPage=${i}">${i}</a></button></li>
							</c:forEach>
							<c:if test="${map.next}">
								<li><button style="color: black; width:50px; height:50px"><a href="mypage?currentPage=${map.currentPage+5}">Next</a></button></li>
							</c:if>
						</ul>
					</nav>		  			
					</td>
				</tr>
			</table>	
		</div>
		<!-- 사용자 포인트/쿠폰 화면 -->
		<!------------------------------------------------------------------------------------------------------------------------------------->		
		<div id="tab-2" class="tab-content">
			<div class="point_class">
				<h1>포인트를 확인하시겠습니까?</h1>
				<button><a href="point?id=${dto.id}">point 확인하러 가기</a></button>
			</div>
		</div>
		<!-- 사용자 개인정보관리 화면 -->
		<!------------------------------------------------------------------------------------------------------------------------------------->
		<div id="tab-3" class="tab-content">
			<div class="imformation_class">
				<h1>개인정보를 확인하시겠습니까?</h1>
				<button><a href="imformation?id=${dto.id}">개인정보 확인하러 가기</a></button>
			</div>
		</div>
		<!------------------------------------------------------------------------------------------------------------------------------------->
		<!-- 티켓 예매 내역 화면 -->
		<div id="tab-4" class="tab-content">
			<div class="ticket_class">
				<h1>티켓 예매 내역 화면입니다.</h1>						
				<button><a href="mypage_ticket?id=${dto.id}">예매내역 확인하러 가기</a></button>
			</div>
		</div>
		<!-- 돌아가기 -->
		<!------------------------------------------------------------------------------------------------------------------------------------->
		<div id="tab-5" class="tab-content">
			<div class="back_class">
				<h1>돌아가기</h1>						
				<button><a href="main?id=${dto.id}">돌아가기</a></button>
			</div>
		</div>
		<!------------------------------------------------------------------------------------------------------------------------------------->
		
	</div>
</body>
</html>