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

.boardcontainer{
   display: flex;
   flex-direction: column;
   align-items: center;
   margin-left: 100px;
}

.maintitle{
    margin-bottom: 100px;
}

.title{
   margin-bottom: 30px;
}

div.title > h1 {
   margin-left: 10px;
}

.boarddiv{
    overflow-y: scroll;
    height: 200px;
}


.board{
   text-align: center;
   border-collapse: collapse;
   width: 800px;
   overflow: scroll;
}

.board > tr, td, th{
   border: solid 1px black;
}

.board > tr, td{
   padding: 10px;
}


.modifybtn{
    border:1px solid black;
    padding: 3px;
}

.infobuttons{
    margin-top: 30px;
    padding: 20px;
    margin-left: 550px;
}

.infobuttons>span{
    border:1px solid black;
    padding:10px;
}


body > div.container > div > div.infobuttons > span:nth-child(1){
    margin-right: 20px;
}


</style>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
	$(function(){
	
	
	})
</script>
</head>
<body>
<div class= "container">
        <jsp:include page="admin_menu.jsp"></jsp:include>
    <div class="boardcontainer"> 
        <div class="maintitle">
            <h1>선수 및 코치진 정보</h1>
        </div>
        <div class="title">
            <h2>선수명단</h2>    
        </div>

        <div class="boarddiv">
            <table class="board">
                <tr>
                    <th>선택</th>
                    <th>번호</th>
                    <th>이름</th>
                    <th>기능</th>
                </tr>
                <c:forEach var="list" items="${playerList}">
                <tr>
                    <td><input type="checkbox" name="RowCheck" id=""></td>
                    <td>${list.player_code}</td>
                    <td>${list.player_name}</td>    
                    <td><span><a href="./admin_teaminfoModify?player_backno=${list.player_backno}" class="modifybtn">수정</a></span></td>      
                </tr>
                </c:forEach>
            </table>
        </div>

            <div class="infobuttons">
                <span><a href="admin_teaminfoWrite">항목추가</a></span>
                <span><a href="">선택항목 삭제</a></span>
            </div>

    
    </div> 
</div>
</body>
</html>