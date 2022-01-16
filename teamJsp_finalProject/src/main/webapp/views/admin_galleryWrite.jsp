<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin_galleryForm.css" />
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	function SelectCheck(){
		var gno = $("input[name=galleryno]").val();
		var cno = $("input[name=gallery_category_no]").val();
		var title = $("input[name=gallery_title]").val();
		var furl = $("input[name=file_url]").val();
		console.log(gno);
		if(gno == '' || cno == '' || title == '' || furl == '') {
			alert("공백이 있으면 안됩니다.");			
			return false;
		}else{
			return true;
		}
	}
</script>

<div id="adg-container">
	<jsp:include page="admin_menu.jsp"></jsp:include>
	   <div class="contents-box">
		<h2>갤러리 추가</h2>		
		<div class="category-info">
			<h4>-카테고리 번호</h4>
			<p><b>포토:&emsp;</b> 1.경기장면 &emsp;&emsp; 2.응원장면 &emsp; 3.이모저모</p>
			<p><b>비디오:</b> 4.하이라이트 &emsp; 5.기획영상 &emsp; 6.기타영상</p>
		</div>
		
		
	<form action="writeGallery" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		<table>
			<tr>
				<th>갤러리 번호</th>
				<td><input type="text" name="galleryno"/></td>
			</tr>
			<tr>
				<th>카테고리번호</th>
				<td><input type="text" name="gallery_category_no" id="" /></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="gallery_title" id="" /></td>
			</tr>	
			<tr>
				<th>파일주소 url</th>
				<td><input type="text" name="file_url" /></td>
			</tr>
			<tr>
				<td colspan="2">
					<button class="btn"><a href="gallery">목록으로</a></button>
					<input class="btn" type="submit" value="추가하기" onclick=" return SelectCheck()"/>					
				</td>
			</tr>
		</table>
	</form>
	</div>
</div>    