<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin_gallery.css" />
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	$(function() {
		$(".add-btn").on("click", function() {
			location.href="writeGallery";
		})
				
	})
	
		
	function SelectCheck() {
		var ck = $(".ckBox").is(":checked");
		console.log(ck);
		if(ck == false){
			alert("항목을 최소 하나 이상 선택하세요.");
			return false;	
		}else{
			return true;
		}
	}		

</script>
	


<div id="admin-gallery-container">
	<jsp:include page="admin_menu.jsp"></jsp:include>

	<div class="contents-box">
		<h2>갤러리 관리</h2>		
		<div class="category-info">
			<h4>-카테고리 번호</h4>
			<p><b>포토:&emsp;</b> 1.경기장면 &emsp;&emsp; 2.응원장면 &emsp; 3.이모저모</p>
			<p><b>비디오:</b> 4.하이라이트 &emsp; 5.기획영상 &emsp; 6.기타영상</p>
		</div>
		
		<div class="category-div">
			 <a class="tabActive1" href="gallery?currentPage=1&galleryCategoryNo=1">경기장면</a> <span>&emsp;|&emsp;</span>      
             <a class="tabActive2" href="gallery?currentPage=1&galleryCategoryNo=2">응원장면</a> <span>&emsp;|&emsp;</span>
             <a class="tabActive3" href="gallery?currentPage=1&galleryCategoryNo=3">이모저모</a> <span>&emsp;|&emsp;</span>
			 <a class="tabActive1" href="gallery?currentPage=1&galleryCategoryNo=4">하이라이트</a> <span>&emsp;|&emsp;</span>      
             <a class="tabActive2" href="gallery?currentPage=1&galleryCategoryNo=5">기획영상</a> <span>&emsp;|&emsp;</span>
             <a class="tabActive3" href="gallery?currentPage=1&galleryCategoryNo=6">기타영상</a>            
		</div>
		<form action="deleteGallery" onsubmit="return confirm('정말 삭제하시겠습니까?')">
		<table>
			<tr>
				<th></th>
				<th width="100">갤러리번호</th>
				<th width="100">카테고리번호</th>
				<th width="350">제목</th>
				<th width="100">작성일</th>
				<th width="350">파일url</th>
			</tr>
			<c:forEach var="list" items="${list}">
				<tr>
					<td><input class="ckBox" type="checkbox" name="galleryno" value="${list.galleryno}"/></td>
					<td>${list.galleryno}</td>
					<td>${list.gallery_category_no}</td>
					<td><a class="gall-title" href="modifyGallery?galleryno=${list.galleryno}">${list.gallery_title}</a></td>
					<td>${list.gallery_date}</td>
					<td>${list.file_url }</td>
				</tr>
			</c:forEach>				
		</table>
		
		<div style="text-align:right;">
			<input class="delete-btn" type="submit" value="선택 삭제" onclick="return SelectCheck()" />
			<input class="add-btn" type="button" value="갤러리 추가" />
		</div>
		</form>
		
		<div class="paging-btn">
			<ul>
				<c:if test="${map.prev}">
					<li><a href="gallery?currentPage=${map.currentPage -5}&galleryCategoryNo=${map.category}">Previous</a></li>					
				</c:if>
				
				<c:forEach begin="${map.startPageNo}" end="${map.endPageNo}" var="i">
					<li><a href="gallery?currentPage=${i}&galleryCategoryNo=${map.category}">${i}</a></li>
				</c:forEach>
				
				<c:if test="${map.next}">
						<li><a href="gallery?currentPage=${map.currentPage + 5}&galleryCategoryNo=${map.category}">Next</a></li>
				</c:if>
			</ul>
		</div>
			
	</div>




</div>


