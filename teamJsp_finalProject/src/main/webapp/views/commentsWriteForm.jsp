<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/fan_boardDetail.css" />
</head>
<body>
	<form action="commentsWrite" method="post">
	<input type="hidden" id="writer" name="${_csrf.parameterName}" value="${_csrf.token}" />
	          		<input type="hidden" name="id" value="${id}" />
	            	<input type="hidden" name="fanno" value="${dto.fanno }" />
		   <div class="writecomment">댓글작성</div>
		   <div class="writebox">
		   <input type="text" name="comment_contents">
		      <button class="writebtn" type="submit">작성</button>
		   </div>
	  </form>
</body>
</html>