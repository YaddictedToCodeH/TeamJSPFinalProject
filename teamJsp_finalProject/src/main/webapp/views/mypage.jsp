<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="../resources/css/main.css" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script> 
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
	height: 1800px;
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
}
/*누르는 색*/
ul.tabs1 li.current {
	color: #222;
}

/*탭 사이즈*/
ul.tabs2 {
	margin: 80px 0px 80px 0px;
	padding: 0px;
	list-style: none;
	
}

/*탭 버튼 설정*/
ul.tabs2 li {
	border-radius: 25px;
	display: inline-block;
	color: white;
	padding: 10px 15px;
	cursor: pointer;
	width:300px;
	height: 100px;
}
/*누르는 색*/
ul.tabs2 li.current {
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

</style>
</head>
<body>
<div class="sw-introduce">
	<h1>마이페이지</h1>
		<ul class="tabs1">
			<li class="btn btn-secondary btn-lg" data-tab="tab-1"><sec:authentication property="name"/>님</li>
			<li class="btn btn-secondary btn-lg" data-tab="tab-2">문의내역</li>
			<li class="btn btn-secondary btn-lg" data-tab="tab-3">포인트</li>
		</ul>
		<ul class="tabs2">	
				<li class="btn btn-secondary btn-lg" data-tab="tab-4">개인정보관리</li>
				<li class="btn btn-secondary btn-lg" data-tab="tab-5">티켓 예매내역</li>
		</ul>

		<!-- 사용자 첫화면 -->
		<!------------------------------------------------------------------------------------------------------------------------------------->		
		<div id="tab-1" class="tab-content current">
			<table class="table table-striped">
				<tr>
					<th>게시물번호</th>
					<th>작성자</th>
					<th>제목</th>
					<th>작성일시</th>
				</tr>
				
				<c:forEach var="dto" items="${list }">
					<tr>
						<th>${dto.bno }</th>
						<th>${dto.writer }</th>
						<th><a href="detail?bno=${dto.bno}">${dto.title }</a></th>
						<th>${dto.regdate }</th>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="4">
					<nav aria-label="Page navigation example">
						<ul class="pagination">
							<c:if test="${map.prev}">
								<li class="page-item"><a class="page-link" href="mypage?currentPage=${map.currentPage-5}">Previous</a></li>
							</c:if>
							<c:forEach var="i" begin="${map.startPageNo }" end="${map.endPageNo }">
								<li class="page-item"><a class="page-link" href="mypage?currentPage=${i}">${i}</a></li>
							</c:forEach>
							<c:if test="${map.next}">
								<li class="page-item"><a class="page-link" href="mypage?currentPage=${map.currentPage+5}">Next</a></li>
							</c:if>
						</ul>
					</nav>		  			
					</td>
				</tr>
			</table>	
		</div>
		<!-- 사용자 문의내역 화면 -->
		<!------------------------------------------------------------------------------------------------------------------------------------->		
		<div id="tab-2" class="tab-content">
				<table class="table table-striped">
				<tr>
					<td colspan="4">
						<a href="write" class="btn btn-outline-primary">문의 내역 작성하러 가기</a>
					</td>
				</tr>
				<tr>
					<th>게시물번호</th>
					<th>작성자</th>
					<th>제목</th>
					<th>작성일시</th>
				</tr>
				
				<c:forEach var="dto" items="${list }">
					<tr>
						<th>${dto.bno }</th>
						<th>${dto.writer }</th>
						<th><a href="detail?bno=${dto.bno}">${dto.title }</a></th>
						<th>${dto.regdate }</th>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="4">
					<nav aria-label="Page navigation example">
						<ul class="pagination">
							<c:if test="${map.prev}">
								<li class="page-item"><a class="page-link" href="mypage?currentPage=${map.currentPage-5}">Previous</a></li>
							</c:if>
							<c:forEach var="i" begin="${map.startPageNo }" end="${map.endPageNo }">
								<li class="page-item"><a class="page-link" href="mypage?currentPage=${i}">${i}</a></li>
							</c:forEach>
							<c:if test="${map.next}">
								<li class="page-item"><a class="page-link" href="mypage?currentPage=${map.currentPage+5}">Next</a></li>
							</c:if>
						</ul>
					</nav>		  			
					</td>
				</tr>
			</table>
		</div>
		<!-- 사용자 포인트/쿠폰 화면 -->
		<!------------------------------------------------------------------------------------------------------------------------------------->
		<div id="tab-3" class="tab-content">
			<h1>포인트 화면입니다.</h1>
		</div>
		<!------------------------------------------------------------------------------------------------------------------------------------->
		<!-- 사용자 개인정보관리 화면 -->
		<div id="tab-4" class="tab-content">
			<form action="modify" method="post">
				<table class="table table-striped">
					<input type="hidden" name="status" value=${dto.status } />
					<input type="hidden" name="ip" value=${dto.ip } />
					<input type="hidden" id="writer" name="${_csrf.parameterName}" value="${_csrf.token}" />
				<tr>
					<th>아이디(이메일 주소 형식)</th>
					<td><input type="text" name="writer" id="" value="<sec:authentication property="name"/>" readonly/></td>
				</tr>
			
				<tr>
					<th>이름</th>
					<td><input type="text" name="name" id="" value="오원준" readonly/></td>
				</tr>

				<tr>	
					<th>생년월일</th>
					<td><input type="text" name="hiredate" id="" value="1999.10.13" readonly/></td>
				</tr>

				<tr>
					<th>성별</th>
					<td><input type="text" name="gender" id="" value="남자" readonly/></td>
				</tr>

				<tr>
					<th>휴대전화 번호</th>
					<td><input type="text" name="number" id="" value="010-1234-1234" readonly/></td>
				</tr>
			
				<tr>
					<td colspan="4">
					<a href="#" class="btn btn-outline-primary">비밀번호 변경하러 가기</a>
					</td>
				</tr>
				</table>
			</form>
		</div>
		<!-- 티켓 예매 내역 화면 -->
		<!------------------------------------------------------------------------------------------------------------------------------------->
		<div id="tab-5" class="tab-content">
			<h1>티켓 예매 내역 화면입니다.</h1>						
		</div>
		<!------------------------------------------------------------------------------------------------------------------------------------->
		
	</div>
</body>
</html>