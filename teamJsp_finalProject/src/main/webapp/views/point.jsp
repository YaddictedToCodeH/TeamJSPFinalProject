<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.point_div {
	border: solid 1px black;
	width: 1200px;
	height: 1000px;
	background-color: #D3D3D3;
	margin: 0 auto;
	text-align: center;
}

table {
	position: relative;
	top:100px;
	width: 1200px;
	height: 480px;
	margin: 0 auto;
	border-spacing: 80px;
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

.point_class{
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
	<div class="point_div">
		<div class="point_class">
			<h1>
				<img class="minilogo" src="../resources/images/kt-emblem-img.png" />포인트
			</h1>
		</div>
		<table>
			<tr>
				<th>아이디</th>
				<td>${dto.id }</td>
				<th>포인트</th>
				<td>${dto.mem_point }</td>
			</tr>

			<tr>
				<td colspan="4"><a href="mypage" style="text-decoration: none">목록으로가기</a></td>
			</tr>
		</table>
	</div>
</body>
</html>