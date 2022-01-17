<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!-- Required meta tags -->
<meta charset="utf-8">
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
	<div class="container">
		<form action="mypage" method="post">
			  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<div class="mb-3">
			  <label for="writer" class="form-label">작성자</label>
			  <input type="text" class="form-control" id="writer" name="id"
			  value='<sec:authentication property="name"/>' readonly="readonly"/>
			</div>
			
			<div class="mb-3">
			  <label for="title" class="form-label">제목</label>
			  <input type="text" class="form-control" id="title" name="inq_title" placeholder="제목">
			</div>
			
			<div class="mb-3">
			  <label for="contents" class="form-label">내용</label>
			  <textarea class="form-control" id="contents" name="inq_contents" rows="3"></textarea>
			</div>
	
			<div class="mb-3">
				<input type="submit" class="btn btn-outline-success" value="등록" />
			</div>
		</form>
	</div>
</body>
</html>