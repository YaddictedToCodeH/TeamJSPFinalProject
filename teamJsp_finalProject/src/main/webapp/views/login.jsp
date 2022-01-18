<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<link rel="stylesheet" href="./resources/css/login.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="./resources/js/login.js"></script>

<jsp:include page="./header.jsp"></jsp:include>

<div id="loginPage">
	<div class="loginWrap">
		<div class="loginHeader">
			<div class="loginHeaderLogo">
				<img src="./resources/images/blacklogo_lg.png" alt="로고">
			</div>
		</div>
		<div class="loginSec">
			<div class="loginForm">
				<form name="loginAccess" action="<c:url value="/login" />"
					method="post">
					<c:if test="${not empty error}">
					<p class="loginMsg"><c:out value="${error}"></c:out></p>					
					</c:if>
					<div class="id">
						<input type="text" name="username" id="username" placeholder="아이디">
						<p class="loginIdMsg">ID를 입력해주세요.</p>
					</div>
					<div class="pw">
						<input type="password" name="password" id="password" placeholder="비밀번호">
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" />
						<p class="loginPwMsg">PW를 입력해주세요.</p>
					</div>
					<input type="checkbox" name="saveId" id="saveId">&nbsp;<label
						for="saveId" class="saveIdText">ID 저장하기</label>
					<button type="button" class="login">로그인</button>
				</form>
			</div>
			<p class="loginMenu">
				<a href="./registerTerm">회원가입</a>
				&nbsp; <a href="./findId">ID 찾기</a>
				&nbsp; <a href="./findPw">비밀번호찾기</a>
			</p>
		</div>
	</div>
</div>

<jsp:include page="./footer.jsp"></jsp:include>