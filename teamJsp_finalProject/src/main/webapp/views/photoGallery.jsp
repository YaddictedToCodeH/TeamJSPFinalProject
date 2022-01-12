<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <meta http-equiv="Pragma" content="no-cache"> -->
<title>수원 KT 소닉붐</title>
<link rel="stylesheet" href="./resources/css/photoGallery.css" type="text/css" />
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	$(function () {
		// 파라미터 값 받는 정규식
		function getParameterByName(name) {
	        name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
	        var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
	        results = regex.exec(location.search);
	        return results == null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
	    }
		
		// 경기장면|응원장면|이모저모 css용
		var param = getParameterByName('galleryCategoryNo');
		
		if(param == 1) {
			$('.tabActive1').css("font-size","23px").css("font-weight","bold");
		}else if(param == 2) {
			$('.tabActive2').css("font-size","23px").css("font-weight","bold");
		}else if(param ==3) {
			$('.tabActive3').css("font-size","23px").css("font-weight","bold");			
		}
		
		
		
		// selectBox 값 고정
		var selectSort = getParameterByName('sort_order');
		if(selectSort == 'old_order') {
			$("#old_order").attr('selected', 'selected');
		}else if(selectSort == 'latest_order') {
			$("#latest_order").attr('selected', 'selected');
		}else if(selectSort == 'like_order'){
			$("#like_order").attr('selected', 'selected');
			alert("아직 미구현 입니다.");
		}
	/*
	console.log("현재페이지: " + ${map.currentPage});
	console.log("총페이지: " +${map.totalPage});
	console.log("시작번호: " +${map.startNo});
	console.log("끝번호: " +${map.endNo});
	console.log("시작페이지: " +${map.startPageNo});
	console.log("끝페이지: " +${map.endPageNo});
	*/
	
	})	
</script>
</head>
<body>

 <div id="container">
 	
 		<jsp:include page="header.jsp"></jsp:include>
 		
        <div id="menu">
            <h1>KT 포토 갤러리</h1>
            <span>
                <a class="tabActive1" href="gallery?currentPage=1&galleryCategoryNo=1">경기장면</a>
                <span>|</span>
                <a class="tabActive2" href="gallery?currentPage=1&galleryCategoryNo=2">응원장면</a>
                <span>|</span>
                <a class="tabActive3" href="gallery?currentPage=1&galleryCategoryNo=3">이모저모</a>
            </span>
        </div>
        
	        <div id="selectBox">
	            <form action="gallery?currentPage=1&galleryCategoryNo=${map.category}" method="GET">
                <select id="sort_order" name="sort_order">    
                    <option disabled >정렬</option>
                    <option id="latest_order" value="latest_order">최신순</option>
                    <option id="old_order" value="old_order">오래된순</option>
                    <option id="like_order" value="like_order">좋아요순</option>
                </select>
                <input type="hidden" name="galleryCategoryNo" value="${map.category}" />
                <input type="submit" value="조회" />
	            </form>
	        </div>
     
        <!------------------------------------------------------------>
        <c:forEach var="list" items="${list}">
	        <div class="photoZone">
	        	<a href="photoGalleryDetail?galleryno=${list.galleryno}"> 
	                <div class="contents">
	                    <div><img src="${list.file_url}" alt="img"></div>
	                    <div><span class="category">${list.gallery_category}</span></div>            
	                    <div><span class="title" title="${list.gallery_title}">${list.gallery_title}</span></div>
	                    <div><span class="date">${list.gallery_date }</span></div>
	                </div>          
	        	</a>
	        </div>  
        </c:forEach>
      
        <!-- (clear:both용)-->
      	<div class="clearfixed"></div>

 		<div class="paging">
 			<ul>
 			 <c:if test="${map.prev}">
 				<li><a href="gallery?currentPage=${map.currentPage - 5}&galleryCategoryNo=${map.category}">Previous</a></li> 					
 			</c:if>
 					
 			<c:forEach begin="${map.startPageNo}" end="${map.endPageNo}" var="i">
 				<li><a href="gallery?currentPage=${i}&galleryCategoryNo=${map.category}">${i}</a></li>
 			</c:forEach>
 					
 			<c:if test="${map.next}">
 				<li><a href="gallery?currentPage=${map.currentPage + 5}&galleryCategoryNo=${map.category}">Next</a></li>
 			</c:if>
 			</ul>
 		</div>
        
   <jsp:include page="footer.jsp"></jsp:include>     
        
    </div>
   
</body>
</html>