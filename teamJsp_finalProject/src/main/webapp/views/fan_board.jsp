<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>팬게시판</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/fan_board.css" />
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
</script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>

    <div class="container">
        <div class="title"><h1>팬게시판</h1></div>

            <div class="sortdiv">
                <form action="fan_board" method="get">
                    <select name="sort_option" id="sort_option">
                        <option value="latest"
                        <c:if test="${map.sort_option == 'latest'}">selected</c:if>            
                        >최신순</option>
                        <option value="old"
                        <c:if test="${map.sort_option == 'old'}">selected</c:if>            
                        >오래된순</option>
                        <option value="like"
                        <c:if test="${map.sort_option == 'like'}">selected</c:if>            
                        >좋아요순</option>
                    </select>
                    <input type="hidden" name="">
                    <input type="submit" value="조회">
                </form>
            </div>

                <table class="board">              
                    <tr>
                        <th class="fth">번호</th>
                        <th class="fth">제목</th>
                        <th class="fth">작성자</th>
	                    <th class="fth">작성일</th>
	                    <th class="fth">조회수</th>
	                    <th class="fth">좋아요</th>
	                </tr>
	                
	                <c:forEach var="dto" items="${fan_board }">
	                <tr>
	                    <td class="ftd">${dto.fanno }</td>
	                    <td class="ftd"><a class="titletext" href="fan_boardDetail?fanno=${dto.fanno }">${dto.fan_title }</a></td>
	                    <td class="ftd">${dto.id } </td>
	                    <td class="ftd">${dto.fan_date } </td>
	                    <td class="ftd">${dto.fan_hit } </td>
	                    <td class="ftd">${dto.fan_hit } </td>
	                </tr>
	                </c:forEach>
            	</table>
				
				<form action="fan_board" method="post">
	                <div class="search">
	                    <div class="searchsort">
		                        <select name="search_option" id="search_option">
		                            
		                            <option value="fan_title"
		                            <c:if test="${map.search_option == 'fan_title'}">selected</c:if>
		                            >제목</option>
		                            
		                           
		                            <option value="id" 
		                            <c:if test="${map.search_option == 'id' }">selected</c:if>
		                            >작성자</option>

		                         	<option value="fan_contents"
		                         	<c:if test="${map.search_option == 'fan_contents'}">selected</c:if>
		                         	>내용</option>
		                         	
		                         	<option value="all"
		                         	<c:if test="${map.search_option == 'all'}">selected</c:if>
		                         	>작성자+내용+제목</option>
		                         	
		                        </select>
	                    </div>
	                    
	                    <div class="searchinput"><input name="keyword" type="text"></div>
	                    <button type="submit" class="searchbutton">검색</button>
	
	                	<div class="write"><a href="fan_boardWrite">글쓰기</a></div>
	            	</div>
				</form>

            <div class=pagebutton>
                <ul class="pageul">
                    <c:if test="${map.prev}">
							<li class="prev"><a class="page-link" href="fan_board?currentPage=${map.currentPage-1}"> 이전 </a></li>
						</c:if>
					<c:forEach var="i" begin="${map.startPageNo }" end="${map.endPageNo }">
							<li class="currentpage"><a class="page-link" href="fan_board?currentPage=${i}">${i}</a></li>
					</c:forEach>
					<c:if test="${map.next}">
							<li class="next"><a class="page-link" href="fan_board?currentPage=${map.currentPage+1}"> 다음 </a></li>
						</c:if>
                </ul>
            </div>
            
    </div>
    
    <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>