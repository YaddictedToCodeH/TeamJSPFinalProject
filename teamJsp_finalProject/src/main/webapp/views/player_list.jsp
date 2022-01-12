<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <link rel="stylesheet" href="./resources/css/player_list.css" />
    
    <jsp:include page="./header.jsp" />

    
    <div id="player-container">
        <div class="player-title">
            <hr><span>KT 소닉붐 선수명단</span>
            <hr>
        </div>
    

        <div class="player-list">

            <div class="player-position-list">
                <span><a href="./playerList">전체</a></span> <hr>
                <span><a href="./playerList?player_pos=guard">가드</a></span> <hr>
                <span><a href="./playerList?player_pos=forward">포워드</a></span> <hr>
                <span><a href="./playerList?player_pos=center">센터</a></span>
            </div>

            <table class="player-list-table">
            	<c:forEach var="list" varStatus="i" items="${playerList}">
            	<c:if test="${i.count%3 eq 1}"><tr></c:if>
            		<td>
            			<a href="./playerDetail?player_backno=${list.player_backno}">
	                        <img src="./resources/images/playerBg.jpg" alt="" class="playerBg">
	                        <img src="${list.player_img}" alt="" class="playerImg">
	                        <span class="player-number">No.${list.player_backno}</span>
	                        <span class="player-position">${list.player_pos}</span>
	                        <span class="player-name">${list.player_name}</span>
	                        <span class="player-spec">${list.player_height}cm / ${list.player_weight}kg</span>
                        </a>
                    </td>
                <c:if test="${i.count%3 eq 0 || i.count eq i.end}"></tr></c:if>
            	</c:forEach>
            </table>
        </div> 
    </div>
    
    
    <jsp:include page="./footer.jsp"></jsp:include>