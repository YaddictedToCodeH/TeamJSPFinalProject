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
    
    .formcontainer{
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

    .replydiv{
        border: 1px solid black;
        padding: 30px;
    }

    .replaytable > tr, td, th{
        padding: 10px;
    }
      
    .replybutton{
       align-items: center;
       padding:5px;
       margin-left: 350px;
    }
    </style>
</head>
<body>
    <div class= "container">
	<jsp:include page="admin_menu.jsp"></jsp:include>
      <div class="formcontainer"> 
        <div class="title">
            <h1>문의사항관리</h1>    
        </div>

        <form action="admin_inquireReply" method="post">
        	<input type="hidden" name="inq_status" value= "1" />
        	<input type="hidden" name="inqno" value= "${dto.inqno}" />
        	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
        	
            <div class="replydiv">
                <table class="relplytable">
                    <tr>
                        <th>제목</th>
                        <td>${dto.inq_title}</td>
                        <th>등록일</th>
                        <th>${dto.inq_date}</th>
                    </tr>
                    <tr>
                        <th>문의내용</th>
                        <td colspan="3"><textarea cols="80" name="inq_contents" rows="10">${dto.inq_contents}</textarea></td>
                    </tr>
                    <tr>
                        <th>답변내용</th>
                        <td colspan="3"><textarea cols="80" name="inq_ans" rows="10">${dto.inq_ans}</textarea></td>
                    </tr>           
                </table>

                <button type="submit" class="replybutton">답변등록</button>

            </div>
        </form>
         
      </div> 
    </div>
</div>
</body>

</body>
</html>