<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배너 이미지 교체</title>
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
            margin-top:50px;
        }
    
        .title{
            margin-bottom: 30px;
        }
        
        div.title > h1 {
            margin-left: 10px;
        }
    
        .bannerdiv{
            border: 1px solid black;
            padding: 30px;
        }

        .changebutton{
            padding:5px;
            margin-left:500px;
        }

    </style>
</head>
<body>
   <div class= "container">
        <jsp:include page="admin_menu.jsp"></jsp:include>
          <div class="formcontainer"> 
            <div class="title">
                <h1>배너이미지 교체</h1>    
            </div>
    
            <form action="" method="post">
                <div class="bannerdiv">
                    <h3>현재 배너</h3>  
                    <div class="bannerimg">
                        <img src="${pageContext.request.contextPath}/resources/images/banner.jpg" alt="">
                    </div>
                    <br>
                    <br>
                    <h3>교체할 배너 이미지</h3>  
                    <br>
                    <div>
                        <input type="file" name="" id="">
                    </div>
                    <br>
                    <br>
                    <button type="submit" class="changebutton">교체</button>
    
                </div>
            </form>
             
          </div> 
        </div>
    </div>
</body>
</html>