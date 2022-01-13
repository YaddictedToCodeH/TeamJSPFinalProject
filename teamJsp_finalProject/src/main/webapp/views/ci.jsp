<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
.ci {
	margin: 0 auto;
	height: 1900px;
	width: 1200px;
	border: solid 1px black;
	text-align: center;	
	background-color: #D3D3D3;
	margin-top: 170px;
}

.img-emblem{
	width: 240px;
	height: 190px;
	padding: 80px;
}

.img-uniform{
	width: 600px;
	height: 400px;
	padding: 80px;
}

.img-slogan{
	width: 600px;
	height: 400px;
	padding: -10px;
}
.emblem1{
	width: 1070px;
	background: white;
	border: solid 1px white;
	border-radius: 15px;
	text-align: center; 
	position: relative;
	left: 60px;
	margin: 30px 0px 30px 0px;
}

.uniform1{
	width: 1070px;
	background: white;
	border: solid 1px white;
	border-radius: 15px;
	text-align: center; 
	position: relative;
	left: 60px;
	margin: 30px 0px 30px 0px;
}

.slogan1{
	width: 1070px;
	background: white;
	border: solid 1px white;
	border-radius: 15px;
	text-align: center; 
	position: relative;
	left: 60px;
	margin: 30px 0px 30px 0px;
}
.emblem2{
	border-radius: 15px;
	width: 1070px;
	height: 380px;
	background: white;
	position: relative;
	left: 60px;
	margin: 30px 0px 30px 0px;
}

.uniform2{
	border-radius: 15px;
	width: 1070px;
	height: 500px;
	background: white;
	position: relative;
	left: 60px;
	margin: 30px 0px 30px 0px;
}

.slogan2{
	border-radius: 15px;
	width: 1070px;
	height: 450px;
	background: white;
	position: relative;
	left: 60px;
	margin: 30px 0px 30px 0px;
}
.minilogo{
	width: 70px;
	height: 60px;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>

	<div class="ci">
		<div class="emblem">
			<div class="emblem1">
				<h1><img class="minilogo" src="./resources/images/kt-emblem-img.png"/>엠블럼</h1>
			</div>
			<div class="emblem2">
				<img class="img-emblem" src="./resources/images/kt-emblem-img.png" />
			</div>
		</div>
		<div class="uniform">
			<div class="uniform1">
				<h1><img class="minilogo" src="./resources/images/kt-emblem-img.png"/>유니폼 소개</h1>
			</div>
			<div class="uniform2">
				<img class="img-uniform" src="./resources/images/kt-uniform.png" />
			</div>
		</div>
		<div class="slogan">
			<div class="slogan1">
				<h1><img class="minilogo" src="./resources/images/kt-emblem-img.png"/>슬로건</h1>
			</div>			
			<div class="slogan2">
				<img class="img-slogan" src="./resources/images/kt-slogan.png" />
			</div>
		</div>
	</div>
	
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>