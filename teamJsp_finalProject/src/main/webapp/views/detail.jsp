<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table class="table table-striped">
		<h1>문의 내역 작성</h1>
		<tr>
			<th>게시물 번호</th>
			<td>${dto.inqno }</td>
			<th>작성자</th>
			<td>${dto.id }</td>
		</tr>
		
		<tr>
			<th>작성일시</th>
			<td>${dto.inq_date }</td>
			<th>답변상황</th>
			<td>${dto.inq_status }</td>
		</tr>
		
		<tr>
			<th>제목</th>
			<td colspan="3">${dto.inq_title }</td>
		</tr>
		<tr>
			<th>내용</th>
			<td colspan="3">${dto.inq_contents }</td>
		</tr>
		<tr>
			<th>답변상황</th>
			<td colspan="3">${dto.inq_ans }</td>
		</tr>
		<tr>
			<td colspan="4">
				<a href="mypage" class="btn btn-outline-primary">목록으로 가기</a>
			</td>
		</tr>
	</table>
</body>
</html>