<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수원 KT 소닉붐</title>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
	text-decoration: none;
	list-style: none;
}

#container {
	margin: auto;
	width: 1200px;
}

.photo_title {
	margin-top: 100px;
	width: 1180px;
	height: 40px;
	font-size: 18px;
	font-weight: bold;
	padding-left: 20px;
	padding-top: 13px;
	border-radius: 15px;
	background-color: #d3d3d3;
}

.photo_url {
	text-align: center;
	margin-top: 50px;
}


.photo_date {
	padding-top: 15px;
	padding-bottom: 17px;
	padding-left: 20px;
	border-bottom: 1px solid #111;
}

.date_front {
	font-size: 15px;
	font-weight: bold;
	padding-right: 10px;
}

.date_back {
	font-size: 14px;
	padding-right: 40px;
}

.photo_contents {
	margin-top: 20px;
	width: 100%;
}

.btn_list {
	background-color: black;
	width: 90px;
	height: 35px;
	border: none;
	border-radius: 10px;
}

.like_div {
	text-align: center;
	margin-top: 50px;
	margin-bottom: 40px;
}
.like_div>button>img {
	width: 35px;
	height: 35px;
}
.btn_like {
	width: 80px;
	height: 80px;
	background: white;
	border-radius: 40px;
	border: 1px solid black;
}
.btn_like:hover{
	color: red;
	border: 1px solid red;
	cursor: pointer;
}

.btn_div {
	text-align: center;
	margin-top: 30px;
	padding-bottom: 100px;
}
.btn_list {color: white;}
.btn_list:hover {cursor: pointer;}

</style>

</head>
<body>
	<div id="container">
	
		<jsp:include page="header.jsp"></jsp:include>

        <div class="photo_title">${dto.gallery_title}</div>

        <div class="photo_contents">
            <div class="photo_date">
                <span class="date_front">작성일</span> <span class="date_back">${dto.gallery_date}</span>
                <span class="date_front">조회수</span> <span class="date_back">${dto.gallery_hit}</span>
            </div>

            <div class="photo_url">
                <iframe width="900" height="600" src="${dto.file_url}" title="YouTube video player" 
                	frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
            </div>
            
            <div class="like_div">
            	<button class="btn_like">
	            	<img src="./resources/images/like.png" alt="like" /><br />
	            	<span>좋아요</span>       	
            	</button>
            </div>

            <div class="btn_div">
                <a href="./videoGallery"><button class="btn_list">목록으로</button></a>
            </div>

        </div>
        
	 <jsp:include page="footer.jsp"></jsp:include>
    </div>



</body>
</html>