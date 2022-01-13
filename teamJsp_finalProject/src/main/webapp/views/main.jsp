<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css" />
<title>[수원kt]폭발적인 2022! KT 소닉붐</title>
<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>

	<div id="main-container">
		<!-- script 실행시 영상이 담길 div와 교체될 img태그-->
		<div id="player"></div>
		<img src="${pageContext.request.contextPath}/resources/images/banner.jpg" id="imgTarget" style="width:1200px;height:500px;display:none;"/> 
		
		
		<div id="container-boby">			
			<div id="rank-div">
				<div class="div-title"><span>팀순위</span><a href="rank">더보기 ></a></div>
				<div class="rank-list">
					<ul>
						<c:forEach var="rank" items="${rank}">
						   	<li>
							 <span class="team-rank">${rank.team_rank}</span>
							 <img src="${pageContext.request.contextPath}${rank.team_logo}" alt="icon" />
						     <span>${rank.team_name}</span>
						     <span class="team-save">${rank.win}W | ${rank.lose}L | <fmt:formatNumber value="${rank.winRate}" pattern="0.000"></fmt:formatNumber></span>
							</li>
						</c:forEach>
	
					</ul>
				</div>
			</div><!-- rank-div end -->
			
				
			<div id="game-div">
				<div class="div-title"><span>KT 경기일정</span><a href="schedule">더보기 ></a></div>
				<div class="game-list">
					<ul>
						<c:forEach var="sd" items="${schedule}">
							<li>
								<div><span class="date-arena">${sd.game_date} | ${sd.game_arena}</span></div>
								<div class="game-box">
									<span><img src="${pageContext.request.contextPath}${sd.team_logo}" alt="" /></span>
									<c:if test="${sd.game_score ne null }">
									<span class="game-score">${sd.game_score}</span>
									</c:if>
									<c:if test="${sd.game_score eq null }">
									<span class="game-score">&ensp; VS &ensp;</span>
									</c:if>
									<span class="logo2"><img src="${pageContext.request.contextPath}${sd.team_logo2}" alt="" /></span>
								</div>
							</li>
						</c:forEach>
				
					</ul>
				</div>			
			</div><!-- game-div end -->
			
			
			<div id="notice-div">
				<div class="div-title"><span>최신소식</span><a href="notice">더보기 ></a></div>
				<div class="notice-list">
					<ul>
						<c:forEach var="nt" items="${notice}">
							<li>
								<div class="notice-title"><a href="noticeDetail?noticeno=${nt.noticeno}" title="${nt.notice_title}">${nt.notice_title}</a></div>
								<div class="notice-date"><span>${nt.notice_date }</span></div>
							</li>
						</c:forEach>
					</ul>
				</div>	
			</div><!-- notice-div end -->
			
					
			<div id="gallery-div">
				<div class="div-title"><span>갤러리</span><a href="gallery">더보기 ></a></div>
				<div class="gallery-list">
						<ul>
						<c:forEach var="gal" items="${gallery}">
							<li>
								<a href="photoGalleryDetail?galleryno=${gal.galleryno}"> 
				                <div class="gallery-box">
				                    <div><img src="${gal.file_url}" alt="img"></div>
				                    <div><span class="gal-category">${gal.gallery_category}</span></div>            
				                    <div class="overflow"><span class="gal-title" title="${gal.gallery_title}">${gal.gallery_title}</span></div>
				                    <div><span class="gal-date">${gal.gallery_date }</span></div>
				                </div>          
				        		</a>
							</li>
						</c:forEach>
						</ul>		
				</div>	
			</div><!-- gallery-div end -->
			
			<div id="player-div">
				<a href="playerDetail?player_backno=2">
					<img id="arena-img" src="${pageContext.request.contextPath}/resources/images/main_arena.jpg"/>
					<img id="player-img" src="https://kbl.or.kr/files/kbl/players-photo/291085.png"/>
				<div id="player-info">
					<span>KT Sonic Boom</span><br />
					<span id="star-plaery">Star Player</span><br />
					<span style="font-size: 20px;">No.2 허훈</span>
				</div>
				</a>
			</div>
				
			<div id="store-div">
				<a href="store">
				<img src="${pageContext.request.contextPath}/resources/images/main_store.jpg"/>
				<span id="store-span">공식 온라인 스토어</span>
				<div id="store-rink"><span>바로가기▶</span></div>
				</a>
			</div>
				
		 <!-- (clear:both용)-->
	     <div class="clearfixed"></div>	
	     	    			
		</div>

	</div>


	<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>