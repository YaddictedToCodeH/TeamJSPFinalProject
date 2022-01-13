<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/noticeDetail.css" />
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>

    <div class="container">
        <div class="title">${dto.notice_title}</div>
        
        <div class="contents">
            <div class="datehits">
                <span>작성일  ${dto.notice_date}</span> |
                <span>조회 ${dto.notice_hit}</span>
            </div>
            <div class="news">
                ${dto.notice_contents}
            </div>
            <div class="buttons">
            
            <c:if test="${map.prev}">
                <span class="prev"><a href="/teamJsp_finalProject/noticeDetail?noticeno=${dto.noticeno-1 }">이전글</a></span>
             </c:if>
              
                <span class="home"><a href="/teamJsp_finalProject/notice">목록</a></span>
             
             <c:if test="${map.next}">
                <span class="next"><a href="/teamJsp_finalProject/noticeDetail?noticeno=${dto.noticeno+1 }">다음글</a></span>
           	 </c:if>
            
            </div>
            
        </div>

    </div>
    
    <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>