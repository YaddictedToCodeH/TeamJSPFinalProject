<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css" />
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/header.js"></script>


<header id="header">
	<div class="logo">
		<a href="#"><img src="${pageContext.request.contextPath}/resources/images/logo.png" alt="로고" class="logoimg"></a>
	</div>
	<nav class="mainnav">
		<div class="headermenu">
			<!-- jsp: 로그인 시 로그아웃, 마이페이지로 변경 -->
			<span><a href="">로그인</a></span> <span><a href="">회원가입</a></span>
		</div>
		<ul class="mainmenu navall">
			<div class="mainmenu-underline"></div>
			<li><a href="">SONICBOOM</a></li>
			<li><a href="">Team</a></li>
			<li><a href="">Game</a></li>
			<li><a href="">Ticket</a></li>
			<li><a href="">KT Board</a></li>
			<li><a href="">Store</a></li>
		</ul>
	</nav>
	<nav class="subnav navall">
		<div class="subnavwrap">
			<ul>
				<li><a href="">구단소개</a></li>
				<li><a href="">CI소개</a></li>
				<li><a href="">홈구장</a></li>
			</ul>
			<ul>
				<li><a href="">코칭스태프</a></li>
				<li><a href="">지원스태프</a></li>
				<li><a href="">플레이어</a></li>
				<li><a href="">응원단</a></li>
			</ul>
			<ul>
				<li><a href="schedule">일정 및 결과</a></li>
				<li><a href="rank">팀/선수 순위</a></li>
				<li><a href="">기록실</a></li>
			</ul>
			<ul>
				<li><a href="">예매하기</a></li>
				<li><a href="">티켓가격</a></li>
				<li><a href="">예매 안내사항</a></li>
			</ul>
			<ul>
				<li><a href="notice">공지사항</a></li>
				<li><a href="gallery">포토갤러리</a></li>
				<li><a href="videoGallery">영상갤러리</a></li>
				<li><a href="fan_board">팬게시판</a></li>
			</ul>
			<ul></ul>
		</div>
	</nav>
</header>