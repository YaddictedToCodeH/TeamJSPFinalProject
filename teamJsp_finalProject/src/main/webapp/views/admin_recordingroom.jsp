<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<div id="ajaxWrap">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin_recordingroom.css" />
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/admin_recordingroom.js"></script>
    
    
    <jsp:include page="./admin_menu.jsp" />
    
    
    <div id="recordingroom" style="margin-top:50px;">
        <div id="recordroom-tabmenu">
            <span href="" rel="player_recordroom" class="">선수 기록실</span>
            &nbsp; | &nbsp;
            <span rel="team_recordroom" class="active">팀 기록실</span>
        </div>

        <div id="recordroom-table-wrap">
            
            <div id="team_recordroom">
                <table class="team_recordroom-table">
                    <tr>
                        <th>선택</th>
                        <th>순위</th>
                        <th>팀</th>
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
                	<c:forEach var="list" varStatus="i" items="${teamRecordlist}">
                		<tr>
                        	<td><input type="checkbox" name="RowCheck" id=""></th>
                			<th>${i.count}</th>
                			<td>${team_name[i.index]}</td>
                			<td>${list.winteam}</td>
                			<td>${list.loseteam}</td>
                			<td>${list.team_pts}</td>
                			<td>${list.team_reb}</td>
                			<td>${list.team_ast}</td>
                			<td>${list.team_stl}</td>
                			<td>${list.team_bs}</td>
                			<td>${list.team_to}</td>
                			<td>
                				 <span class="btn"><a href="admin_recordingroomModify2?teamno=${list.teamno}&team_name=${team_name[i.index]}">수정</a></span>
            					 <span class="btn"><a href="">삭제</a></span>
                			</td>
                		</tr>
                	</c:forEach>
                </table>
            </div>
			
            <div id="player_recordroom">
                <table class="player_recordroom-table">
                    <tr>
                        <th>선택</th>
                        <th>선수코드</th>
                        <th>순위</th>
                        <th>선수명</th>
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
                    
                    <c:forEach var="list" varStatus="i" items="${playerRecordlist}">
	                    <tr>
	                    	<td><input type="checkbox" name="RowCheck" id=""></th>
                    		<th>${list.player_code}</th>
                    		<th>${i.count}</th>
	                        <td>${player_name[i.index]}</td>
	                        <td>${list.player_pts}</td>
	                        <td>${list.player_min}</td>
	                        <td>${list.player_fg}</td>
	                        <td>${list.player_three}</td>
	                        <td>${list.player_ft}</td>
	                        <td>${list.player_reb}</td>
	                        <td>${list.player_ast}</td>
	                        <td>${list.player_stl}</td>
	                        <td>${list.player_bs}</td>
	                        <td>${list.player_to}</td>
	                        <td>
                				 <span class="btn"><a href="admin_recordingroomModify?player_code=${list.player_code}&player_name=${player_name[i.index]}">수정</a></span>
            					
            					 <span class="btn"><a href="">삭제</a></span>
                			</td>
	                    </tr>
                    </c:forEach>
                    
                </table>
            </div>

        </div>

    </div>
    
    </div>
    