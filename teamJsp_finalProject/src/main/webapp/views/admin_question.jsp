<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
      

    .title{
        margin-bottom: 30px;
    }
    
    div.title > h1 {
    	margin-left: 10px;
    }

  
    .board{
        text-align: center;
        border-collapse: collapse;
        width: 800px;
    }

    .board > tr, td, th{
        border: solid 1px black;
    }

    .board > tr, td{
        padding: 20px;
    }

    .pagebutton{
    	margin-top:30px;
        padding: 10px;
        display: flex;
        justify-content: center;

    }

    </style>
</head>
<body>
    <div class= "container">
	<jsp:include page="admin_menu.jsp"></jsp:include>
      <div class="boardcontainer"> 
        <div class="title">
            <h1>문의사항 관리</h1>    
        </div>

        <div class="boarddiv">
            <table class="board">
                <tr>
                     <th>번호</th>
                     <th>처리상태</th>
                     <th>제목</th>
                    <th>작성자</th>
                    <th>문의날짜</th>
                    <th>기능</th>
                </tr>
                <tr>
                      <td>1</td>
                      <td>미응답</td>
                      <td>홈페이지 업데이트 언제??</td>
                      <td>aaa</td>
                      <td>문의날짜</td>
                      <td>
                          <span><a href="">답변하기</a></span>
                          <span><a href="">삭제</a></span>
                      </td>
                </tr>
                <tr>
                      <td>1</td>
                      <td>미응답</td>
                      <td>홈페이지 업데이트 언제??</td>
                      <td>aaa</td>
                      <td>문의날짜</td>
                      <td>
                          <span><a href="">답변하기</a></span>
                          <span><a href="">삭제</a></span>
                      </td>
                </tr>

           	 </table>
                <div class="pagebutton">
                    <div><a>1</a></div>
                    <div><a>2</a></div>
                    <div><a>3</a></div>
                    <div><a>다음</a></div>
                </div>
       		</div>
         
      </div> 
    </div>
</div>
</body>
</html>