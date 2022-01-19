<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.modify_container {
	border: solid 1px black;
	width: 1200px;
	height: 1100px;
	background-color: #D3D3D3;
	margin: 0 auto;
	text-align: center;
}

.form_input {
	border: none;
	width: 400px;
	height: 100px;
	border-radius: 15px;
	font-size: 30px;
	margin: 20px 0px 20px 0px;
}

.modify_text {
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
	margin: 25px 10px 25px 10px;
	width: 680px;
	height: 80px;
	border-radius: 15px;
	text-align: center;
	font-size: 30px;
	border: none;
}
h2{
	font-weight: bolder;
}

.button_class{
	color: black;
	font-weight: bolder;
}
.button_class2{
	color: black;
	font-weight: bolder;
}

.text_class a{
	color: black;
	text-decoration: none;
}
.text_class th{
	color: #DE1313;
	font-weight: bolder;
}
.text_class button{
	margin: 25px 20px 25px 20px;
	width: 380px;
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
	<div class="modify_container">
		<form action="modify" method="post">
				<div class="modify_text">
					<h2>
						<img class="minilogo" src="../resources/images/kt-emblem-img.png" />문의사항
					</h2>
				</div>
			<table class="modify_table">
				<input type="hidden" id="writer" name="${_csrf.parameterName}" value="${_csrf.token}" />
				<tr class="text_class">
					<th>아이디</th>
					<td><input type="text" name="id" id="" value="${dto.id }" class="form_input" readonly/> </td>
					<th>비번</th>
					<td><input type="password" name="pwd" id="" value="${dto.pwd }" class="form_input"/></td>
				</tr>
			
				<tr class="text_class">
					<th>이름</th>
					<td><input type="text" name="mem_name" id="" value="${dto.mem_name }" class="form_input" readonly/></td>
					<th>생년월일</th>
					<td><input type="text" name="mem_birth" id="" value="${dto.mem_birth }" class="form_input" readonly/></td>
				</tr>
			
				<tr class="text_class">
					<th>전화번호</th>
					<td><input type="text" name="mp" id="" value="${dto.mp } " class="form_input" readonly/></td>
					<th>메일</th>
					<td><input type="text" name="mail" id="" value="${dto.mail }" class="form_input"/></td>
				</tr>
				<tr class="text_class">
					<th>주소</th>
					<td><input type="text" name="addrs" id="" value="${dto.addrs }" class="form_input" readonly/></td>
				</tr>
				<tr class="text_class">
					<td colspan="2">
						<input type="submit" class="button_class" value="수정하기" />
					</td >
					<td colspan="2">
					 	<button><a href="mypage?id=${dto.id}" class="button_class">돌아가기</a></button>
					</td>	
				</tr>
			</table>
		</form>
	</div>	
</body>
</html>