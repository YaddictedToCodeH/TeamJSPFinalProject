<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수원 KT 소닉붐</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/galleryDetail.css" />
<script src="http://code.jquery.com/jquery-latest.js"></script>

<script>
	$(function() {
		
		$(".btn_like").on("click", function check() {
			
			var id = '<%=session.getAttribute("id")%>'
			var galleryno = ${dto.galleryno}
			
				
			// CSRF
			var token = $("input[name='_csrf']").val(); 
			var header = $("input[name='_csrf_header']").val();

			var obj = {
				'id' : id
				, 'galleryno' : galleryno
			};
			
		   	$.ajax({
			   type : "POST"
			   , url : 'recommend'
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
					   $('.btn_like').removeClass('btn_like_active');
				   }else if(response == 1) {
					    $('.btn_like').addClass('btn_like_active');
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
	<div id="container">
	
		<jsp:include page="header.jsp"></jsp:include>
				
		<form action="return false;">
			<input type="hidden" name="_csrf_header" value="${_csrf.headerName}" />
			<input type="hidden" name="_csrf" value="${_csrf.token}" />
		</form>

        <div class="photo_title">${dto.gallery_title}</div>

        <div class="photo_contents">
            <div class="photo_date">
                <span class="date_front">작성일</span> <span class="date_back">${dto.gallery_date}</span>
                <span class="date_front">조회수</span> <span class="date_back">${dto.gallery_hit}</span>
                <span class="date_front">좋아요</span> <span class="date_back">${count}</span>
            </div>

            <div class="photo_url">
                <img src="${dto.file_url}" alt="img" />
            </div>
            
            <div class="like_div">
            	<c:if test="${id == null || id == '' }">
            		<span>좋아요 기능은 로그인 후 사용 가능합니다.</span>
            	</c:if> 
            	<c:if test="${id != null }">
            		<c:if test="${recom.likeCheck eq null}">
            			<button class="btn_like">
			            	<img src="${pageContext.request.contextPath}/resources/images/like.png" alt="like" /><br />
			            	<span>좋아요</span>       	
		            	</button>
            		</c:if>
            		
            		<c:if test="${recom.likeCheck == 1}">
            			<button class="btn_like">
			            	<img src="${pageContext.request.contextPath}/resources/images/like.png" alt="like" /><br />
			            	<span>좋아요</span>       	
		            	</button>
            		</c:if>          	
            	</c:if>  
            </div>

            
            <div class="btn_div">
                <a href="${pageContext.request.contextPath}/gallery"><button class="btn_list">목록으로</button></a>
            </div>

        </div>
	
	<jsp:include page="footer.jsp"></jsp:include>
    </div>
    
    <script>
		$(function() {
			var likeCheck = ${recom.likeCheck}
			
			if(likeCheck == 1) {
				$('.btn_like').addClass('btn_like_active');
			}else if(likeCheck == 0 || likeCheck == null){
				$('.btn_like').removeClass('btn_like_active');
			}
						
			
		})
    </script>



</body>
</html>