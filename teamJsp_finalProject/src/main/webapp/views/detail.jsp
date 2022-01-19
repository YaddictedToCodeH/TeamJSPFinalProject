<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
				<img class="minilogo" src="../resources/images/kt-emblem-img.png" />상세 정보
			</h1>
		</div>
		<table>
			<tr>
				<th>게시물번호</th>
				<td>${dto.inqno }</td>
				<th>ID</th>
				<td>${dto.id }</td>
			</tr>

			<tr>
				<th>날짜</th>
				<td>${dto.inq_date }</td>
				<th>답변상태</th>
				<td>${dto.inq_status }</td>
			</tr>

			<tr>
				<th>제목</th>
				<td>${dto.inq_title }</td>
				<th>내용</th>
				<td>${dto.inq_contents }</td>

			</tr>
			<tr>
				<th>답변내용</th>
				<td colspan="4">${dto.inq_ans }</td>
			</tr>
			<tr>
				<td colspan="4"><a href="mypage" style="text-decoration: none">목록으로가기</a></td>
			</tr>
		</table>
	</div>
</body>
</html>
