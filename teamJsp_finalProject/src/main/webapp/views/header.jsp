<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css" />
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/header.js"></script>

<header id="header">
	<div class="logo">
		<a href="main"><img src="${pageContext.request.contextPath}/resources/images/logo.png" alt="로고" class="logoimg"></a>
	</div>
	<nav class="mainnav">
		<div class="headermenu">
			<!-- jsp: 로그인 시 로그아웃, 마이페이지로 변경 -->
			<c:if test="${id eq null}">
				<span><a href='<c:url value="/member/main" />'>로그인</a></span> <span><a href="registerTerm">회원가입</a></span>
			</c:if>
			<c:if test="${id eq 'admin'}">
				<span><a href="<c:url value="/admin/admin_main" />">관리자 페이지</a></span>
			</c:if>
			<c:if test="${id ne null}">
				<span><a href="<c:url value="/member/mypage" />">${id}님 마이페이지</a>
				<a href="logout" onclick="return confirm('정말 로그아웃 하시겠습니까?')">로그아웃</a></span>
			</c:if>
		</div>
		<ul class="mainmenu navall">
			<div class="mainmenu-underline"></div>
			<li><a href="introduce">SONICBOOM</a></li>
			<li><a href="playerList">Team</a></li>
			<li><a href="schedule">Game</a></li>
			<li><a href="ticketNotice">Ticket</a></li>
			<li><a href="notice">KT Board</a></li>
			<li><a href="store">Store</a></li>
		</ul>
	</nav>
	<nav class="subnav navall">
		<div class="subnavwrap">
			<ul>
				<li><a href="introduce">구단소개</a></li>
				<li><a href="ci">CI소개</a></li>
				<li><a href="map">홈구장</a></li>
			</ul>
			<ul>
				<li><a href="staff_c">코칭스태프</a></li>
				<li><a href="staff_s">지원스태프</a></li>
				<li><a href="playerList">플레이어</a></li>
				<li><a href="cheerleader">응원단</a></li>
			</ul>
			<ul>
				<li><a href="schedule">일정 및 결과</a></li>
				<li><a href="rank">팀/선수 순위</a></li>
				<li><a href="recordingroom">기록실</a></li>
			</ul>
			<ul>
				<li><a href="<c:url value="/member/ticketing" />">예매하기</a></li>
				<li><a href="ticketPrice">티켓가격</a></li>
				<li><a href="ticketNotice">예매 안내사항</a></li>
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