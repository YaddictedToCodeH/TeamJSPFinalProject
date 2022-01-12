<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
	$(document).ready(function() {
	//ul -> tabs -> li에 있는 걸 클릭하면
		$('ul.tabs li').click(function() {
			var tab_id = $(this).attr('data-tab');
	//현페이지가 사라지고
			$('ul.tabs li').removeClass('current');
			$('.tab-content').removeClass('current');
	//클릭한 페이지가 생긴다. ? 
			$(this).addClass('current');
			$("#" + tab_id).addClass('current');
		})

	});
</script>
<style>
/*메인크기*/
.sw-introduce {
	border: solid 1px black;
	height: 1900px;
	width: 1200px;
	margin: 0 auto;
}

/*탭 사이즈*/
ul.tabs {
	margin: 0px;
	padding: 0px;
	list-style: none;
}

/*탭 버튼 설정*/
ul.tabs li {
	display: inline-block;
	background: #898989;
	color: white;
	padding: 10px 15px;
	cursor: pointer;
}
/*누르는 색*/
ul.tabs li.current {
	color: #222;
}
/* 이거없으면 탭 기능상실 */
.tab-content {
	display: none;
	padding: 12px;
}

/* 이거없으면 모든 게시글 사라짐 */
.tab-content.current {
	display: inherit;
}
/*  tab-1에 있는 글자 가운데로 모이게함*/
#tab-1 {
	text-align: center;
}

/* p에 있는 글자 설정*/
#tab-1 p {
	text-align: center;
	font-size: 20px;
	margin: 0 auto;
	font-weight: 800;
	width: 1100px;
	height: 150px;
	line-height: 38px;
}

/* h1빨갛게함 */
h1 {
	color: red;
}

/* 멤버사진 조정 */
.imglogo {
	width: 350px;
	height: 250px;
}

.imgmem {
	margin: 0 auto;
	height: 400px;
	width: 1100px;
	height: 500px;
	padding: 50px;
}
.logostory{
	height: 300px;
	width: 400px;
	text-align: left;
}

.history div{
	font-size: 20px;
	margin: 0 auto;
	font-weight: 800;
	line-height: 38px;
}
.gamehistory p{
	padding: 70px;
	text-align: right;
	font-size: 40px;
	margin: 0 auto;
	font-weight: 1000;
	line-height: 78px;
}
.gamelogohistory{
	position: absolute;
	height: 550px;
	width: 600px;
	top: 1000px;
	
}
.history p{
	font-weight: 900;
	font-size: 20px;
}
</style>
</head>
<body>
	<div class="sw-introduce">
		<ul class="tabs">
			<li class="tab-link current" data-tab="tab-1">구단소개</li>
			<li class="tab-link" data-tab="tab-2">구단연혁</li>
		</ul>

		<div id="tab-1" class="tab-content current">
			<img class="imglogo" src="../images/kt logo.png" />

			<h1>신비롭고 강력한 힘, 상상의 농구 실현</h1>
			<p>
				kt 소닉붐은 2013년, 제 10구단에 대한 국민들의 강한 열망 KT그룹의 뜨거운 유치 열정으로 가득한 소닉!<br>
				소닉이라는 이름으로 신비롭고 강력한 힘으로 상상의 농구를 실현하겠다는 의지를 가지고 새롭게 출범하였습니다.<br>
			</p>
			<!-------------------------------------------------------------------------------------->
			<h1>명문구단을 위한 철저한 플랜!</h1>
			<p>
				명문구단이 되기 위한 철저한 중장기 플랜을 통해 kt 소닉 붐의 감독 및 코칭 스태프, 선수들을 구성하고 있습니다!<br>
				굵은 땀방울과 함께 전지훈련을 수행하고 기량을 쌓은 후, kt 소닉 붐 이름 그대로 소닉과 같은 농구를 펼쳐보이기 위해<br>
				노력을 다하고 있습니다!<br>
			</p>
			<!-------------------------------------------------------------------------------------->
			<h1>복합 문화공간의 첨단 농구장!</h1>
			<p>
				kt그룹의 우수한 ICT기술을 활용한 ‘빅 테인먼트(BIC Tainment)’ 기술을 적극 활용하여<br> 농구를
				사랑하는 팬 여러분께 차별화된 농구 콘텐츠를 제공하고 남녀노소 누구나 즐겁고 편하게 농구를 즐길 수 있는<br>
				복합 문화공간의 첨단 농구장을 만들 예정입니다!<br>
			</p>
			<!-------------------------------------------------------------------------------------->
			<h1>재미와 즐거움을 추구하는 근성 있는 구단!</h1>
			<p>
				창단 과정에서 경기도민과 수원시민들이 보내주신 성원과 기대에 보답하기 위해 앞으로도 농구를 통한<br> 즐거운
				여가문화를 제공할 것이며 팬들과 함께 할 수 있는 새롭고 다양한 마케팅을 전개해 나아가<br> “재미와 즐거움을
				추구하는 근성있는 구단”이라는 kt sports의 확고한 비전을 실행하고 다년간 쌓인<br> 스포츠 구단 운영
				노하우로 그라운드 안팎에서 그 동안 없던 새로운 농구를 kt 소닉붐이 이루어 가겠습니다!<br>
			</p>
			<!-------------------------------------------------------------------------------------->
			<img class="imgmem" src="../images/kt member.png">
		</div>

		<div id="tab-2" class="tab-content">
				<table class="history" width="1400">
					<tr>
						<td><img class="logostory" src="../images/광주 나산 플라망스.gif"/></td>
						<td><img class="logostory" src="../images/코리아텐더.png"/></td>
					</tr>
					<tr>
						<td><p>&nbsp&nbsp&nbsp&nbsp&nbsp광주 나산 플라망스(1997년~2001년)</p></td>
						<td><p>&nbsp&nbsp&nbsp&nbsp&nbsp부산 코리아텐더(2001년~2003년)</p></td>
					</tr>
					<tr>
						<td><img class="logostory" src="../images/KTF.png"/></td> 
						<td><img class="logostory" src="../images/부산 kt.jpg"/></td>		
					</tr>	
					<tr>
						<td><p>&nbsp&nbsp&nbsp&nbsp&nbsp부산 KTF 매직윙스 (2003년~2009년)</p></td>
						<td><p>&nbsp&nbsp&nbsp&nbsp&nbsp부산 kt 소닉붐(2009년~2021년)</p></td>	
					</tr>
				</table>
							
			<div class="gamehistory">
				<img class="gamelogohistory" src="../images/kt logo.png"/>
				<p>
				역대 순위&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<br>
				2009-10 시즌 준우승<br>
				2010-11  시즌 우승<br>
				2011-12  시즌 3위<br>
				2012-13 시즌 9위<br>
				2013-14 시즌 5위<br>
				2014-15 시즌 7위<br>
				2015-16 시즌 7위<br>
				2016-17 시즌 9위<br>
				2017-18 시즌 10위<br>
				2018-19 시즌 6위<br>
				2019-20 시즌 6위<br>
				2020-21 시즌 6위<br>
				</p>
			</div>

		</div>
	</div>
	</div>
</body>
</html>