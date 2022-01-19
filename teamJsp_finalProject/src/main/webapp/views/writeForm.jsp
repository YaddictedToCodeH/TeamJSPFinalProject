<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.write_container {
	border: solid 1px black;
	width: 1200px;
	height: 1100px;
	background-color: #D3D3D3;
	margin: 0 auto;
	text-align: center;
}

.form_input {
	border: none;
	width: 970px;
	height: 100px;
	border-radius: 15px;
	font-size: 30px;
	margin: 20px 0px 20px 0px;
}

.write_text {
	width: 970px;
	height: 100px;
	background: white;
	border: solid 1px white;
	border-radius: 15px;
	position: relative;
	left: 115px;
	margin: 20px 0px 20px 0px;
}

.minilogo {
	width: 70px;
	height: 60px;
}

.button_class {
	margin: 25px 50px 25px 50px;
	width: 480px;
	height: 80px;
	border-radius: 15px;
	text-align: center;
	font-size: 30px;
	border: none;
	font-weight: bolder;
}
h1 {
	position: relative;
	right: 450px;
	color: #DE1313;
	font-weight: bolder;
	
}
h2 {
	color: #DE1313;	
	font-weight: bolder;
}
.text_class button{
	margin: 25px 80px 25px 80px;
	width: 280px;
	height: 80px;
	border-radius: 15px;
	text-align: center;
	font-size: 30px;
	border: none;
	font-weight: bolder;
}
a{
	text-decoration: none;
	color: black;
}
</style>
<body>
	<div class="write_container">
		<form action="write" method="post">	
			<div class="write_text">
				<h2>
					<img class="minilogo" src="../resources/images/kt-emblem-img.png" />문의사항
				</h2>
			</div>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				<div class="text_class">
					<h1>작성자</h1>
					<input type="text" id="id" name="id" class="form_input" value='<sec:authentication property="name"/>' readonly="readonly" />
				</div>
					<br> 
				
				<div class="text_class">
					<h1>제목</h1>
					<input type="text" id="inq_title" name="inq_title" class="form_input" placeholder="제목"> 
				</div>
				
					<br> 
				
				<div class="text_class">
					<h1>내용</h1>
					<textarea id="inq_contents" name="inq_contents" class="form_input" rows="3"></textarea>
				</div>

				<div class="text_class">
					<input type="submit" class="button_class" value="등록" />
					<button><a href="mypage?id=${dto.id}" class="button_class">돌아가기</a></button>
				</div>
		</form>
	</div>
	
</body>
</html>