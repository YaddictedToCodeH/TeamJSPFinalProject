<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스토어</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/store.css" />
</head>
<body>
	
		<jsp:include page="header.jsp"></jsp:include>
	
	<div class="container">

        <div class="nlogo">
            <div class="kbl">
                <a href="https://www.kbl.or.kr/" target="_blank"><img src="${pageContext.request.contextPath}/resources/images/kblstore.svg" alt=""></a>
                <h2>KBL 공식스토어</h2>
            </div>
            
            <div class="korea">
                <a href="https://www.kbastore.co.kr/" target="_blank"><img src="${pageContext.request.contextPath}/resources/images/koreastore.png" alt=""></a>
                <h2>국가대표팀<br>공식스토어</h2>
            </div>
            
            <div class="jumpmall">
                <a href="https://jumpmall.co.kr/" target="_blank"><img src="${pageContext.request.contextPath}/resources/images/jumpmall.jpg" alt=""></a>
                <h2>농구용품 전문 점프몰</h2>
            </div>
        </div>

        <div class="player">
            <div><img src="${pageContext.request.contextPath}/resources/images/kblplayer.png" alt=""></div>
        </div>
            
    </div>
    
     <jsp:include page="footer.jsp"></jsp:include>
	
</body>
</html>