<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 - 팬게시판 관리</title>
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
        flex-direction: row;
        align-items: center;
    }
    
    .boardcontainer{
        display: flex;
        flex-direction: column;
        align-items: center;
        margin-left: 100px;
    }
    
    #adminboard-tabmenu{
    	cursor: pointer;
    }
    
     #adminboard-tabmenu span:hover{
    	border-bottom: 1px solid red;
    }
    

    .title{
        margin-top: 30px;
    }
    
    div.title > h1 {
    	margin-left: 10px;
    }

    .buttons{
        margin-top: 30px;
        margin-right: 680px;
        margin-bottom: 10px;
    }

   .buttons > input[type=button]{
       padding: 5px;


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
    	mairgin-top:30px;
        padding: 10px;
    }
    
    .pageul{
    	display:flex;
    	mairgin-top:10px;
    }
    
    .page-link{
    	padding:10px;
    }


</style>
<div id="ajaxWrap">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
    $(function(){
    	   $("#commentboard").hide();

           $("#adminboard-tabmenu > span").on("click", function(){
               $("adminboard-tabmenu > span").removeClass("active");
               $(this).addClass("active");
               $("#admin-table-wrap > div").stop().hide();
               var activeTab = $(this).attr("rel");
               $("#" + activeTab).stop().fadeIn(200);
           })
    	
        $("#allCheck").on('click',function(){   // 체크 박스 전체 눌렀을 경우
            if($('#allCheck').prop("checked")){
                $("input[type=checkbox]").prop("checked",true);
            }else{
                $("input[type=checkbox]").prop("checked",false);
            }
        })

        $("#allCheck2").on('click',function(){

            $("input[type=checkbox]").prop("checked") ? $("input[type=checkbox]").prop("checked",false) :  $("input[type=checkbox]").prop("checked",true);

        })
             
        
        $("#delete").on('click',function(){
    		//console.log("test");		
			deleteValue();
        })
        
 		function deleteValue(){
        	
        	var rowData = new Array();
			var fanno = new Array();
			var checkbox = $("input[name='RowCheck']:checked");
			
			checkbox.each(function(i) {
				
				// checkbox.parent() : checkbox의 부모는 <td>이다.
				// checkbox.parent().parent() : <td>의 부모이므로 <tr>이다.
				var tr = checkbox.parent().parent().eq(i);
				var td = tr.children();
				
				// 체크된 row의 모든 값을 배열에 담는다.
				rowData.push(tr.text());
				
				// td.eq(0)은 체크박스 이므로  td.eq(1)의 값부터 가져온다.
				var no = td.eq(1).text();
				var title = td.eq(2).text()+", ";
				var id = td.eq(3).text()+", ";
				var date = td.eq(4).text()+", ";
				
				// 가져온 값을 배열에 담는다.
				fanno.push(no);
				//tdArr.push(title);
				//tdArr.push(id);
				//tdArr.push(date);
				
				console.log(no);
				console.log(fanno);
				//console.log("title : " + title);
				//console.log("id : " + id);
				//console.log("date : " + date);
			});
			
        	//console.log(fanno);
        	if(fanno.length == 0){
        		alert("선택한 글이 없습니다");
        	}
        	else{
        		var chk = confirm("정말 삭제하시겠습니까?");
        		$.ajax({
        			url : "admin_boardDelete", //전송 URL
        			type : 'GET' , 
        			traditional : true,
        			data : {
        				fanno:fanno // 보내고자 하는 data 변수
        			},
        			success:function(jdata){
        				if(jdata){
        					alert("삭제성공");
        					location.replace("admin_board")
        				}
        				else{
        					alert("삭제실패");
        				}
        			}
        		});
        	}
        }
        
        
    });
</script>
<body>
    <div class= "container" id="recordingroom">
	<jsp:include page="admin_menu.jsp"></jsp:include>
      <div class="boardcontainer"> 
        <div class="title">
            <h1>게시판</h1>
            <div id="adminboard-tabmenu">
                <span rel="fanboard" class="active">게시글</span>
                &nbsp; | &nbsp;
                <span rel="commentboard" class="">댓글</span>
            </div>
        </div>
        <div class="buttons">
            <input type="button" value="전체선택" name="allCheck2" id="allCheck2">
            <input type="button" value="삭제" name="delete" id="delete">
        </div>
        
        <div id="admin-table-wrap">
        
   
        <div class="boarddiv" id="fanboard">
            <table class="board" class="fanboard-table">
                <tr>
                    <th><input type="checkbox" name="allCheck" id="allCheck"></th>
                     <th>번호</th>
                     <th>제목</th>
                    <th>작성자</th>
                    <th>문의날짜</th>
                </tr>
                <c:forEach var="list" items="${list }"> 
                <tr>
                    <td class="fanboard_td"><input type="checkbox" name="RowCheck"  id=""></td>
                    <td class="fanboard_td" >${list.fanno }</td>
                    <td class="fanboard_td">${list.fan_title }</td>
                    <td class="fanboard_td">${list.id }</td>
                    <td class="fanboard_td">${list.fan_date }</td>
                </tr>
                 </c:forEach>
           	 </table>
                    <div class="pagebutton">
			          <ul class="pageul">
			                    <c:if test="${map.prev}">
										<li class="prev"><a class="page-link" href="admin_board?currentPage=${map.currentPage-1}"> 이전 </a></li>
									</c:if>
								<c:forEach var="i" begin="${map.startPageNo }" end="${map.endPageNo }">
										<li class="currentpage"><a class="page-link" href="admin_board?currentPage=${i}">${i}</a></li>
								</c:forEach>
								<c:if test="${map.next}">
										<li class="next"><a class="page-link" href="admin_board?currentPage=${map.currentPage+1}"> 다음 </a></li>
								</c:if>
			           </ul>
        			</div>
       		</div>
        
        	<div class="boarddiv" id="commentboard">
           	 <table class="board" class="commentboard-table">
                <tr>
                    <th><input type="checkbox" name="allCheck" id="allCheck"></th>
                     <th>등록일</th>
                     <th>내용</th>
                    <th>작성자</th>
                </tr>
                <c:forEach var="list2" items="${list2 }"> 
                <tr>
                    <td><input type="checkbox" name="" id=""></td>
                    <td>${list2.comment_date }</td>
                    <td>${list2.comment_contents }</td>
                    <td>${list2.id }</td>
                </tr>
                 </c:forEach>
            		</table>
                    <div class="pagebutton">
	         		 <ul class="pageul">
	                    <c:if test="${map2.prev}">
								<li class="prev"><a class="page-link" href="admin_board?currentPage=${map2.currentPage-1}"> 이전 </a></li>
							</c:if>
						<c:forEach var="i" begin="${map2.startPageNo }" end="${map2.endPageNo }">
								<li class="currentpage"><a class="page-link" href="admin_board?currentPage=${i}">${i}</a></li>
						</c:forEach>
						<c:if test="${map2.next}">
								<li class="next"><a class="page-link" href="admin_board?currentPage=${map2.currentPage+1}"> 다음 </a></li>
						</c:if>
				           </ul>
			        </div>
       		</div>
            
      </div> 
    </div>
</div>
</body>
</html>