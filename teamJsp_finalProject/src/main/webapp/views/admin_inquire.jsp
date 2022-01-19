<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
        padding: 30px;
    }

    .pagebutton{
    	margin-top:30px;
        padding: 10px;
        display: flex;
        justify-content: center;
    }
    
    .btn{
    	border-bottom: 1px solid black;
    	width:15px;
    }
    
    .page-link {
    	padding:10px;
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
                <c:forEach var="list" items="${list }"> 
                <tr>
                      <td>${list.inqno }</td>
	                      <c:if test="${list.inq_status eq 0 }">
								<td>미응답</td>
						  </c:if>
						  <c:if test="${list.inq_status eq 1 }">
								<td>응답완료</td>
						  </c:if>
                      <td>${list.inq_title }</td>
                      <td>${list.id }</td>
                      <td>${list.inq_date }</td>
                      <td>
                          <span class="btn"><a href="admin_inquireReply?inqno=${list.inqno }">답변하기</a></span>
               			  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                          <span class="btn"><a href="admin_inquireDelete?inqno=${list.inqno }">삭제</a></span>
                      </td>
                </tr>
                </c:forEach>


           	 </table>
                <div class="pagebutton">
                     <c:if test="${map.prev}">
										<li class="prev"><a class="page-link" href="admin_inquire?currentPage=${map.currentPage-1}"> 이전 </a></li>
									</c:if>
								<c:forEach var="i" begin="${map.startPageNo }" end="${map.endPageNo }">
										<li class="currentpage"><a class="page-link" href="admin_inquire?currentPage=${i}">${i}</a></li>
								</c:forEach>
								<c:if test="${map.next}">
										<li class="next"><a class="page-link" href="admin_inquire?currentPage=${map.currentPage+1}"> 다음 </a></li>
								</c:if>
                </div>
       		</div>
         
      </div> 
    </div>
</div>
</body>
</html>