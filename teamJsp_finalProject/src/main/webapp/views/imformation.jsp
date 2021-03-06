<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.select_div {
	border: solid 1px black;
	width: 1200px;
	height: 1100px;
	background-color: #D3D3D3;
	margin: 0 auto;
	text-align: center;
}

table {
	width: 1200px;
	height: 900px;
	margin: 0 auto;
	border-spacing: 72px;
	border-collapse: separate;
	font-weight: bolder;
}

td {
	background: white;
	border: solid 4px black;
	border-radius: 15px;
	margin: 25px 25px;
	width: 140px;
}

th {
	background: #DE1313;
	border: solid 4px black;
	border-radius: 15px;
	margin: 25px 25px;
	width: 80px;
}

a {
	text-decoration: none;
	color: black;
}

.minilogo{
	width: 70px;
	height: 60px;
}

.imformation_class{
	width: 970px;
	height: 100px;
	background: white;
	border: solid 1px white;
	border-radius: 15px;
	position: relative;
	left: 115px;
	margin: 30px 0px 30px 0px;
}
</style>
</head>
<body>
	<div class="select_div">
		<div class="imformation_class">
			<h1>
				<img class="minilogo" src="../resources/images/kt-emblem-img.png" />개인정보
			</h1>
		</div>
		<table>
			<tr>
				<th>아이디</th>
				<td>${dto.id }</td>
				<th>비번</th>
				<td>${dto.pwd }</td>
			</tr>

			<tr>
				<th>이름</th>
				<td>${dto.mem_name }</td>
				<th>생년월일</th>
				<td>${dto.mem_birth}</td>
			</tr>

			<tr>
				<th>전화번호</th>
				<td>${dto.mp }</td>
				<th>메일</th>
				<td>${dto.mail }</td>

			</tr>
			<tr>
				<th>주소</th>
				<td>${dto.addrs }</td>
			</tr>
			<tr>
				<td colspan="3"><a href="mypage" style="text-decoration: none">목록으로가기</a></td>
				<td colspan="1"><a href="modifyForm?id=${dto.id}" style="text-decoration: none">개인정보 수정하러 가기</a></td>
			</tr>
		</table>
	</div>
</body>
</html>