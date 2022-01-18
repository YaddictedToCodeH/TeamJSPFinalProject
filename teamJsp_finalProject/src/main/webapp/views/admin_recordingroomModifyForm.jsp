<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<div id="ajaxWrap">
	<link rel="stylesheet" href="./resources/css/admin_recordingroom.css" />
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="./resources/js/admin_recordingroom.js"></script>
    
    
    <jsp:include page="./admin_menu.jsp" />
    
    
    <div id="recordingroom">
        <div id="recordroom-tabmenu">
            <span href="" rel="player_recordroom" class="">선수 기록실</span>
            &nbsp; | &nbsp;
            <span rel="team_recordroom" class="active">팀 기록실</span>
        </div>

        <div id="recordroom-table-wrap">
            
            <div id="team_recordroom">
                <table class="team_recordroom-table">
                    <tr>
                        <th>팀번호</th>
                        <th>팀기록</th>
                        <th>팀명</th>
                        <th>게임no</th>   
                        <th>승</th>
                        <th>패</th>
                        <th>득점</th>
                        <th>리바운드</th>
                        <th>어시스트</th>
                        <th>스틸</th>
                        <th>블록</th>
                        <th>턴오버</th>
                        <th>기능</th>
                    </tr>
                	<c:forEach var="list" varStatus="i" items="${trcd}">
                		<form action="admin_recordingroomModify2" method="post">
                		  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	                		<tr>
	                			<th><input type="text" name="teamno" value="${list.teamno}"></td>
	                			<th><input type="text" name="team_recordno" value="${list.team_recordno}"></td>
	                			<th><input type="text" name="" value="${tn}"></td>
	                			<th><input type="text" name="gameno" value="${list.gameno}"></td>
	                			<td><input type="text" name="winteam" value="${list.winteam}"></td>
	                			<td><input type="text" name="loseteam" value="${list.loseteam}"></td>
	                			<td><input type="text" name="team_pts" value="${list.team_pts}"></td>
	                			<td><input type="text" name="team_reb" value="${list.team_reb}"></td>
	                			<td><input type="text" name="team_ast" value="${list.team_ast}"></td>
	                			<td><input type="text" name="team_stl" value="${list.team_stl}"></td>
	                			<td><input type="text" name="team_bs" value="${list.team_bs}"></td>
	                			<td><input type="text" name="team_to" value="${list.team_to}"></td>
	                			<td><button type="submit">수정</button></td>
	                		</tr>
                		</form>
                	</c:forEach>
                </table>
            </div>

            <div id="player_recordroom">
                <table class="player_recordroom-table">
                    <tr>
                        <th>선수명</th>
                        <th>선수코드</th>
                        <th>게임no</th>
                        <th class="sortMenu">득점</th>
                        <th class="sortMenu">평균 출전시간</th>
                        <th class="sortMenu">필드골</th>
                        <th class="sortMenu">3점슛</th>
                        <th class="sortMenu">자유투</th>
                        <th class="sortMenu">리바운드</th>
                        <th class="sortMenu">어시스트</th>
                        <th class="sortMenu">스틸</th>
                        <th class="sortMenu">블록</th>
                        <th class="sortMenu">턴오버</th>
                        <th class="sortMenu">기능</th>
                    </tr>
                    
                    <c:forEach var="list" varStatus="i" items="${prcd}">
	                    <form action="admin_recordingroomModify" method="post">
		                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		                    <tr>
		                        <th><input type="text" name="" value="${pn}"></td>
	                    		<th><input type="text" name="player_code" value="${list.player_code}"></th>
	                    		<th><input type="text" name="gameno" value="${list.gameno}"></th>
		                        <td><input type="text" name="player_pts" value="${list.player_pts}"></td>
		                        <td><input type="text" name="player_min" value="${list.player_min}"></td>
		                        <td><input type="text" name="player_fg" value="${list.player_fg}"></td>
		                        <td><input type="text" name="player_three" value="${list.player_three}"></td>
		                        <td><input type="text" name="player_ft" value="${list.player_ft}"></td>
		                        <td><input type="text" name="player_reb" value="${list.player_reb}"></td>
		                        <td><input type="text" name="player_ast" value="${list.player_ast}"></td>
		                        <td><input type="text" name="player_stl" value="${list.player_stl}"></td>
		                        <td><input type="text" name="player_bs" value="${list.player_bs}"></td>
		                        <td><input type="text" name="player_to" value="${list.player_to}"></td>
		                        <td><button type="submit">수정</button></td>
		                    </tr>
	                    </form>
                    </c:forEach>
                    
                </table>
            </div>

        </div>

    </div>
    
    </div>
    