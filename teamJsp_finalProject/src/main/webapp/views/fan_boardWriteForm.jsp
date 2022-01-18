<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>팬게시판 - 글쓰기 </title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/fan_boardWrite.css" />
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>

	<div class="container">
			<form action="fan_boardWrite" method="post">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            <div class="title">
                <div class="titletext">
                    <h1>팬게시판</h1>
                    <h3>글쓰기</h3>
                </div>
            </div>

            <div class="inputtop">
                <div class="inputtitle">
                        <label for="titlelabel">제목</label>
                        <input type="text" name ="fan_title" id="fan_title" autofocus>
                </div>
                
                <div class="inputwriter">
                        <label for="writerlabel">작성자</label>
                        <input type="text" name="id" id="id">
                </div>
            </div>
            
        
            <div class="contents">
                <textarea id="fan_contents" name="fan_contents" rows="20" cols="134" placeholder="내용을 입력해주세요"> 
                
                </textarea>  
            </div>


            <div class="buttons">
                <button type="submit" class="writebtn">작성</button>
            </div>
            
		</form>
    </div>
    
    <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>