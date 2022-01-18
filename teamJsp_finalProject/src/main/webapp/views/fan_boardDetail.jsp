<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>팬게시판</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/fan_boardDetail.css" />
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
$(function() {
	
	$(".likebtn").on("click", function check() {
		
		var id = '<%=session.getAttribute("id")%>'
		var fanno = ${dto.fanno}
		
			
		// CSRF
		var token = $("input[name='_csrf']").val(); 
		var header = $("input[name='_csrf_header']").val();

		var obj = {
			'id' : id
			, 'fanno' : fanno
		};
		
	   	$.ajax({
		   type : "POST"
		   , url : 'recommendFan'
		   , data : JSON.stringify(obj)
		   , cache: false  
		   , contentType: "application/json; charset=utf-8"
		   , dataType : "json"
		   , context: this
		   , beforeSend : function(xhr) { 
			   xhr.setRequestHeader(header, token); 
		   }
		   , success : function(response) {	
			   console.log(response);
			   // 성공시 response 1 떨어짐
			   if(response == 3) {
				   alert('오류가 발생되었습니다. 잠시후 시도해주시기  바랍니다');
			   }else if(response == 2){
				   $('.likebtn').removeClass('btn_like_active');
			   }else if(response == 1) {
				    $('.likebtn').addClass('btn_like_active');
			   }
			 	   			   
		   }
		   , error : function(error) {
			   // 오류.
			   alert('오류가 발생되었습니다. 잠시후 시도해주시기  바랍니다');				   
		   }
	   	});
		
	});
	

})
</script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<!-- security post방식 사용시 필요 -->
	<form action="return false;">
			<input type="hidden" name="_csrf_header" value="${_csrf.headerName}" />
			<input type="hidden" name="_csrf" value="${_csrf.token}" />
	</form>
	<div class="container">
	        <div class="title">${dto.fan_title}
	        </div>
	      
	        <div class="contents">
	            <div class="datehits">
	                <span>작성자  ${dto.id}	</span> |
	                <span>작성일  ${dto.fan_date}</span> |
	                <span>조회 ${dto.fan_hit}</span> |
	                <span>좋아요 ${count}</span>
	            </div>
	            <div class="fcontents">
	                ${dto.fan_contents}
	            </div>
	
	            <div class="like">
		            <c:if test="${id == null || id == '' }">
	            		<span>좋아요 기능은 로그인 후 사용 가능합니다.</span>
	            	</c:if> 
	            	<c:if test="${id != null }">
	            		<c:if test="${recom.likeCheck eq null}">
		                <button class="likebtn">
		                    <img src="${pageContext.request.contextPath}/resources/images/like.png" alt=""><br>
		                    <span>좋아요</span>
		                </button>
	               		</c:if>
	               		
	               		<c:if test="${recom.likeCheck == 1}">
	               		<button class="likebtn">
		                    <img src="${pageContext.request.contextPath}/resources/images/like.png" alt=""><br>
		                    <span>좋아요</span>
		                </button>
		                </c:if>
	                </c:if>  
	            </div>
	
	            <div class="buttons">
	                <span class="list"><a href="fan_board">목록</a></span>
	                <span class="modify"><a href="fan_boardModify?fanno=${dto.fanno }">수정</a></span>
	                <span class="delete"><a href="fan_boardDelete?fanno=${dto.fanno }">삭제</a></span>
	            </div>
	            
	        </div>
	        

	
	        <div class="comment">
	        <c:forEach var="list" items="${list }">
	            <div class="commentbox">
	                <div class="cbtitle">${list.id } 
	                	<span>${list.comment_date }
	                	<a class="close" href="commentsDelete?commentno=${list.commentno }&fanno=${list.fanno}">X</a>
	                </span>
	                </div>
	                <div class="commenttext">${list.comment_contents }</div>
	            </div>
	            <br>
	        </c:forEach>
	   
	           	
	            <br>
				<jsp:include page="commentsWriteForm.jsp"/>
	
	        </div>
	
	</div>
	   
	<jsp:include page="footer.jsp"></jsp:include>
	
	<!-- 좋아요 했을시 버튼색 유지용 -->
	 <script>
		$(function() {
			var likeCheck = ${recom.likeCheck}
			
			if(likeCheck == 1) {
				$('.likebtn').addClass('btn_like_active');
			}else if(likeCheck == 0 || likeCheck == null){
				$('.likebtn').removeClass('btn_like_active');
			}
						
			
		})
    </script>
    
    
</body>
</html>