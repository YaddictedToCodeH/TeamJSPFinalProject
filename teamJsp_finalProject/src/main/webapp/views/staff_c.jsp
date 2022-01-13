<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet" href="./resources/css/staff_c.css" />
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="./resources/js/staff_c.js"></script>


<jsp:include page="header.jsp" />

<div id="staff_c-container">
	<div class="staff_c-title">
		<hr>
		<span>코칭 스태프</span>
		<hr>
	</div>

	<div class="staff_c-list">
		<div class="staff_c-positon">
			<span>Manager</span> 
			<span>Assistant Manager</span> 
			<span>Coach</span>
			<span>Coach</span>
		</div>
		<div class="staff_c-list-wrap">
			<div class="staff_c staff_c1">
				<img src="./resources/images/kt_staff_04.png" alt="" class="staff_c-img"> <span>서동철
					감독</span> <img src="./resources/images/blacklogo_sm.png" alt="" class="small-logo">
			</div>
			<div class="staff_c staff_c2">
				<img src="./resources/images/kt_staff_02.png" alt="" class="staff_c-img"> <span>배길태
					수석코치</span> <img src="./resources/images/blacklogo_sm.png" alt="" class="small-logo">
			</div>
			<div class="staff_c staff_c3">
				<img src="./resources/images/kt_staff_01.png" alt="" class="staff_c-img"> <span>박세웅
					코치</span> <img src="./resources/images/blacklogo_sm.png" alt="" class="small-logo">
			</div>
			<div class="staff_c staff_c4">
				<img src="./resources/images/kt_staff_03.png" alt="" class="staff_c-img"> <span>박종천
					코치</span> <img src="./resources/images/blacklogo_sm.png" alt="" class="small-logo">
			</div>
		</div>
	</div>

	<div id="modalWrap">
		<div class="staff_c-modal staff_c-detail1">
			<div class="staff_c-modal-header">
				<span>서동철 감독</span> <span class="ico-close"><i
					class="fas fa-times"></i></span>
			</div>
			<div class="staff_c-modal-info1">
				<img src="./resources/images/kt_staff_04.png" alt="">
				<div>
					<ul>
						<li>생년월일</li>
						<li>1968.11.07</li>
						<li>신장/체중</li>
						<li>184cm/79kg</li>
						<li>출신교</li>
						<li>고려대학교</li>
					</ul>
				</div>
			</div>
			<div class="staff_c-modal-info2">
				<h5>주요경력</h5>
				<ul>
					<li>2018 ~</li>
					<li>KT 감독</li>
					<li>2018</li>
					<li>고려대학교 감독</li>
					<li>2017</li>
					<li>국가대표 여자농구 감독</li>
					<li>2013 ~ 2016</li>
					<li>KB스타즈 여자농구 감독</li>
					<li>2011 ~ 2013</li>
					<li>오리온오리온스 코치</li>
					<li>2004 ~ 2011</li>
					<li>삼성썬더스 코치</li>
					<li>1997 ~ 2002</li>
					<li>삼성생명 여자농구 코치</li>
					<li>1991 ~ 1997</li>
					<li>삼성전자 선수</li>
				</ul>
			</div>
		</div>

		<div class="staff_c-modal staff_c-detail2">
			<div class="staff_c-modal-header">
				<span>배길태 수석코치</span> <span class="ico-close"><i
					class="fas fa-times"></i></span>
			</div>
			<div class="staff_c-modal-info1">
				<img src="./resources/images/kt_staff_02.png" alt="">
				<div>
					<ul>
						<li>생년월일</li>
						<li>1975.05.23</li>
						<li>신장/체중</li>
						<li>182cm/90kg</li>
						<li>출신교</li>
						<li>홍익대학교</li>
					</ul>
				</div>
			</div>
			<div class="staff_c-modal-info2">
				<h5>주요경력</h5>
				<ul>
					<li>2014 ~ 2018</li>
					<li>DB 전력분석원</li>
					<li>2011 ~ 2014</li>
					<li>KCC 매니저</li>
					<li>2007 ~ 2011</li>
					<li>KCC 매니저</li>
					<li>2007</li>
					<li>KCC 선수</li>
					<li>2006 ~ 2007</li>
					<li>DB 선수</li>
					<li>2005 ~ 2006</li>
					<li>오리온 선수</li>
					<li>1999 ~ 2005</li>
					<li>LG 선수</li>
					<li>1997 ~ 1999</li>
					<li>SK 선수</li>
				</ul>
			</div>
		</div>

		<div class="staff_c-modal staff_c-detail3">
			<div class="staff_c-modal-header">
				<span>박세웅 코치</span> <span class="ico-close"><i
					class="fas fa-times"></i></span>
			</div>
			<div class="staff_c-modal-info1">
				<img src="./resources/images/kt_staff_01.png" alt="">
				<div>
					<ul>
						<li>생년월일</li>
						<li>1971.04.11</li>
						<li>신장/체중</li>
						<li>180cm/90kg</li>
						<li>출신교</li>
						<li>고려대학교</li>
					</ul>
				</div>
			</div>
			<div class="staff_c-modal-info2">
				<h5>주요경력</h5>
				<ul>
					<li>2018 ~</li>
					<li>KT 수석코치</li>
					<li>2018</li>
					<li>고려대학교 코치</li>
					<li>2017</li>
					<li>김해가야고 코치</li>
					<li>2015 ~ 2016</li>
					<li>동국대학교 코치</li>
					<li>1997 ~ 2000</li>
					<li>코리아텐더 선수</li>
				</ul>
			</div>
		</div>

		<div class="staff_c-modal staff_c-detail4">
			<div class="staff_c-modal-header">
				<span>박종천 코치</span> <span class="ico-close"><i
					class="fas fa-times"></i></span>
			</div>
			<div class="staff_c-modal-info1">
				<img src="./resources/images/kt_staff_03.png" alt="">
				<div>
					<ul>
						<li>생년월일</li>
						<li>1979.08.01</li>
						<li>신장/체중</li>
						<li>193cm/90kg</li>
						<li>출신교</li>
						<li>경희대학교</li>
					</ul>
				</div>
			</div>
			<div class="staff_c-modal-info2">
				<h5>주요경력</h5>
				<ul>
					<li>2015 ~</li>
					<li>KT 코치</li>
					<li>2009 ~ 2015</li>
					<li>모비스 선수(2년 우승)</li>
					<li>2007 ~ 2009</li>
					<li>삼성 선수</li>
					<li>2005 ~ 2006</li>
					<li>KTF 선수</li>
					<li>2003 ~ 2005</li>
					<li>삼성 선수</li>
				</ul>
			</div>
		</div>

	</div>
</div>

<jsp:include page="footer.jsp"></jsp:include>
