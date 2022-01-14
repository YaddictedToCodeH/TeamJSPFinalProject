<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	   flex-direction: row;
	   align-items: center;
	}
	
	.player-title{
		margin-top:20px;
	}
	
	#player_detail-container{
	   display: flex;
	   flex-direction: column;
	   align-items: center;
	   margin-left: 100px;
	}
	
	#player_detail-container > div.player_detail > div.player_detail-info > img {
		position: absolute;
		width: 200px;
		bottom: 0;
		left: 100px;
	}
	
	#pimg{
		width:200px;
	}
	
	.player_detail-info-table>tr,td,th{
    border: 1px solid black;
    padding: 5px;
    }
    
    input[type=text]{
    	width:100px;
	}
	
	#player_detail-container > .player_detail > form{
		width:900px
	}
	
	.player-detailbtn > button{
		margin-left:410px;
	}
	
		
</style>
</head>
<body>
	<div class= "container">
	<jsp:include page="admin_menu.jsp"/>
	<div id="player_detail-container">
	 
        <div class="player-title">
            <hr><span><h1>선수 정보 입력</h1></span>
            <hr>
        </div>

        <div class="player_detail">
            <form action="admin_teaminfoWrite" method="post">
            <div class="player_detail-info">
                <span class="teamno"><input type="hidden" name="teamno" id="" value="1"></span>
                <table class="player_detail-info-table">
                    <tr>
                    	<th>번호</th>
                        <th>등번호</th>
                        <th>이름</th>
                        <th>포지션</th>
                        <th>생년월일</th>
                        <th>신장</th>
                        <th>체중</th>
                        <th>출신학교</th>
                        <th>SNS</th>
                        <th>이미지</th>
                    </tr>
                    <tr>
                        <td><input type="text" name="player-code" id="" value=""></td>
                        <td><input type="text" name="player_backno" id="" value=""></td>
                        <td><input type="text" name="player_name" id="" value=""></td>
                        <td><input type="text" name="player_pos" id="" value=""></td>
                        <td><input type="text" name="player_birth" id="" value=""></td>
                        <td><input type="text" name="player_height" id="" value=""></td>
                        <td><input type="text" name="player_weight" id="" value=""></td>
                        <td><input type="text" name="player_school" id="" value=""></td>
                        <td><input type="text" name="player_sns" id="" value=""></td>
                        <td><input type="text" name="player_img" id="" value=""></td>
                    </tr>
                </table>
            </div>
            <div class="player-detailbtn">
				<button type="submit" value="">선수정보 추가</button>
			</div>
            </form>
      </div>
	</div>
	
</body>
</html>