<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin_menu.css" />

    <div id="menu">
        <div class="tabmenu">
            <ul class="menulist">
                <a href="admin_main"><img src="${pageContext.request.contextPath}/resources/images/logo.png" alt=""></a>
                <li><a href="gallery">갤러리관리</a></li>
                <li><a href="admin_board">팬게시판</a></li>
                <li><a href="admin_inquire">문의사항</a></li>
                <li><a href="admin_teaminfo">선수 및 코치진</a></li>
                <li><a href="schedule">경기 일정</a></li>
                <li><a href="admin_recordingroom">기록실 정보</a></li>
                <li><a href="admin_banner">배너이미지</a></li>
                <li><a href="<c:url value='/member/main'/>">홈페이지 메인으로</a></li>
            </ul>
        </div>
    </div>

