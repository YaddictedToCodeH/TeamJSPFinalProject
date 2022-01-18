<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지 메인</title>
</head>
<style>
     *{
        margin: 0;
        padding: 0;
        text-decoration: none;
        list-style: none;
    }

    .container{
        width: 1200px;
	    height: 700px;
	    display: flex;
	    flex-direction: column;
	    flex-wrap: wrap;
	    align-content: flex-start
    }
    
    .maincontainer{
        display: flex;
        flex-direction: row;
        align-items: center;
        margin-left: 100px;
        flex-wrap: wrap;
        margin-top: 50px;
    }

    .sub{
        width:530px;
        height:330px;
      
    }

    #schedule{
      display: flex;
      flex-direction: column;
      flex-wrap: wrap;
      justify-content: space-around;
      align-items: center;
      border:1px solid black;
    }
    
    .logo{
    	width:100px;
    	height:50px;
    }

    #vs{
      font-size: 50px;
    }
    
   .ratetb{
      border-collapse: collapse;
      height: 80px;
    }
    
    #rate > div > table > tbody > tr > th:hover{
      cursor: pointer;
      background-color: black;
      color: white;
    }
    
    #inquire{
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: space-around;
    }
    
    #inquire > h4{
    	margin-top: 30px;
    }

    .inquiretb{
      padding: 10px;
      border-collapse: collapse;
    }

    .inquiretb > tr,th,td{
      border: 1px solid black;
      padding: 5px;
    }

</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script> 
<script>

window.onload = function() {

var x1Values = ["21년11월", "21년12월", "22년01월", "22년02월"];
var y1Values = [1000000, 5000000, 4000000, 300000];
var barColors = ["gray", "black","red","aquamarine"];

new Chart("myChart", {
  type: "bar",
  data: {
    labels: x1Values,
    datasets: [{
      backgroundColor: barColors,
      data: y1Values
    }]
  },
  options: {
    legend: {display: false},
    title: {
      display: true,
      text: "월간 매출 현황"
    }
  }
});



var x2Values = ["신규회원수", "방문자수", "예매건수", "취소건수"];
var y2Values = [55, 49, 44, 24, 15];
var barColors = ["gray", "black","red","aquamarine"];

new Chart("myChart2", {
  type: "horizontalBar",
  data: {
    labels: x2Values,
    datasets: [{
      backgroundColor: barColors,
      data: y2Values
    }]
  },
  options: {
    legend: {display: false},
    title: {
      display: true,
      text: "관리 지표"
    }
  }
});




}
</script>
<body>
    <div class= "container">
        <jsp:include page="admin_menu.jsp"></jsp:include>
          <div class="maincontainer"> 
               
                <div id="sales" class="sub">
                    <!-- 차트 -->
                    <canvas id="myChart" width="400" height="250"></canvas>
                </div>
				
				<c:forEach var="sd" items="${schedule}">
                <div id="schedule" class="sub">
                    <div><a href="">예정 경기▶</a>  &nbsp; | &nbsp; <a href="">수정▶</a></div>
                    <div><h2>경기일정</h2></div>
                    <div>${sd.game_date}  | ${sd.game_arena}</div> 
                    <span><img class="logo" src="${pageContext.request.contextPath}${sd.team_logo}" alt="" />
                    <span id="vs">vs</span>
                    <img class="logo" src="${pageContext.request.contextPath}${sd.team_logo2}" alt="" /></span>
               </div> 
               </c:forEach>

                 <div id="rate" class="sub">
                 	<input type="date" name="" id="">
                    <canvas id="myChart2" width="400" height="170"></canvas>
                    <div class="ratediv">
                      <table class="ratetb">
                        <tr>
                          <th>회원수 1600명</th>
                          <th>당일 티켓 판매량 250매</th>
                          <th>사이트 입장 건수 721회</th>
                          <th>문의사항 미답변 12건</th>
                        </tr>
                      </table>
                    </div>
                </div> 
			
                <div id="inquire" class="sub">
                    <h4>최근 문의 내역</h4>
                    <table class="inquiretb">
                        <tr>
                          <th>문의 날짜</th>
                          <th>문의 제목</th>
                          <th>처리 상태</th>
                        </tr>
                    	<c:forEach var="iq" items="${inquire}">
                        <tr>
                          <td>${iq.inq_date}</td>
                          <td>${iq.inq_title}</td>
                           <c:if test="${iq.inq_status eq 0 }">
								<td>미응답</td>
						  </c:if>
						  <c:if test="${iq.inq_status eq 1 }">
								<td>응답완료</td>
						  </c:if>
                        </tr>
                        </c:forEach>
                    </table>
                </div>
        </div>
</html>