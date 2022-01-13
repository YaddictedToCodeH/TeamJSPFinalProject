<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/notice.css" />
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
</script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>

    <div class="container">
        <div class="title"><h1>공지사항</h1></div>
        <table class="board">
            <tr>
                <th class="nth">번호</th>
                <th class="nth">제목</th>
                <th class="nth">작성일</th>
                <th class="nth">조회수</th>
            </tr>
             
            <c:forEach var="dto" items="${notice }">      
            <tr>
                <td class="ntd">${dto.noticeno}</td>
                <td class="ntd"><a class="titletext" href="noticeDetail?noticeno=${dto.noticeno }">${dto.notice_title}</a></td>
                <td class="ntd">${dto.notice_date}</td>
                <td class="ntd">${dto.notice_hit}</td>
            </tr>
            </c:forEach>
            
        </table>
            
           <div class="pagebutton">
	            <ul class="pageul">
	            	<c:if test="${map.prev}">
							<li class="prev"><a class="page-link" href="notice?currentPage=${map.currentPage-1}"> 이전 </a></li>
						</c:if>
					<c:forEach var="i" begin="${map.startPageNo }" end="${map.endPageNo }">
							<li class="currentpage"><a class="page-link" href="notice?currentPage=${i}">${i}</a></li>
					</c:forEach>
					<c:if test="${map.next}">
							<li class="next"><a class="page-link" href="notice?currentPage=${map.currentPage+1}"> 다음 </a></li>
						</c:if>
	            </ul>
           </div>         
    </div>
    
    <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>