<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>팬게시판 - 수정하기</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/fan_boardModify.css" />
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<body>

	<jsp:include page="header.jsp"></jsp:include>
	
	<div class="container">
        <form action="fan_boardModify" method="post">
            <div class="title">
                <div class="titletext">
                    <h1>팬게시판</h1>
                    <h3>수정하기</h3>
                </div>
            </div>

            <div class="inputtop">
                <div class="inputtitle">
                		<input type="hidden" name="fanno" value="${dto.fanno }" />
                        <label for="titlelabel">제목</label>
                        <input type="text" name ="fan_title" id="fan_title" value="${dto.fan_title }">
                </div>
                
                <div class="inputwriter">
                        <label for="writerlabel">작성자</label>
                        <input type="text" name="id" id="id" value="${dto.id }">
                </div>
            </div>
            
        
            <div class="contents">
                <textarea id="fan_contents" name="fan_contents" rows="20" cols="134" placeholder="내용을 입력해주세요"
                autofocus> 
                ${dto.fan_contents}
                </textarea>  
            </div>


            <div class="buttons">
                <button type="submit" class="modifybtn">수정</button>
            </div>
        
        </form>
    </div>
    
    <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>