<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="./header.jsp"></jsp:include>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/selectArea.css" />
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/selectArea.js"></script>
<div id="selectArea-container">
	<div id="ticketing-title">
		<h2>예매하기</h2>
	</div>

	<div id="ticketing-step">
		<span class="active">구역 / 좌석 선택</span> > <span>할인적용</span> > <span>예매확인</span>
		> <span>결제완료</span>
	</div>

	<div id="selectArea-map">
		<p>KT 소닉붐 아레나 좌석배치도</p>
		<img
			src="${pageContext.request.contextPath}/resources/images/areaMap.png"
			alt="">
	</div>

	<div id="selectArea-btnGroup">
		<input type="hidden" id="game_date" value="${dto.game_date }"/>
		<input type="hidden" id="game_arena" value="${dto.game_arena }"/>
		<input type="hidden" id="team_name" value="${dto.team_name }"/>
		<input type="hidden" id="team_name2" value="${dto.team_name2 }"/>
		<input type="hidden" id="team_logo" value="${dto.team_logo }"/>
		<input type="hidden" id="team_logo2" value="${dto.team_logo2 }"/>
		
		<table class="btnGroup-table">
			<tr>
				<td colspan="2">1층</td>
				<td colspan="2">2층</td>
			</tr>
			<tr>
				<td><div class="colorBox" style="background-color: red"></div></td>
				<td><input type="button" value="Y프리미엄코트석" class="areaBtn type1Btn"></td>
				<td><div class="colorBox"
						style="background-color: rgba(153, 118, 28, 0.726);"></div></td>
				<td><input type="button" value="2층 특석" class="areaBtn type1Btn"></td>
			</tr>
			<tr>
				<td><div class="colorBox"
						style="background-color: rgb(115, 60, 145);"></div></td>
				<td><input type="button" value="Side line" class="areaBtn type1Btn"></td>
			</tr>
			<tr>
				<td><div class="colorBox"
						style="background-color: rgb(61, 92, 160);"></div></td>
				<td><input type="button" value="모나파크 테이블석" class="areaBtn type1Btn"></td>
				<td><div class="colorBox" style="background-color: #d36d48;"></div></td>
				<td><input type="button" value="2층 일반석" class="areaBtn type2Btn"></td>
			</tr>
			<tr>
				<td><div class="colorBox"
						style="background-color: rgb(49, 87, 87);"></div></td>
				<td><input type="button" value="원정골대 테이블석" class="areaBtn type1Btn"></td>
			</tr>
		</table>
	</div>

	<div id="MySelect">
		<span>선택좌석 : </span>
		<div class="MySelect-list">
		</div>
	</div>

	<span class="nextStep">완료</span>

</div>




<div id="popup-modal-overlay">
	<!-- 좌석 1유형 -->
	<div id="popup-modal-container" class="type1">
		<div id="popup-modal-title">
			<span>좌석선택</span> <span class="ico-close"><i class="fas fa-times"></i></span>
		</div>
		<div id="popup-modal-body">
			<span class="modal-areaName">모나파크 테이블석</span> 
			<select name="areaNum" class="type1Area">
				<!-- seat_area -->
			</select>
			<div class="modal-seatList">
				<div id="zone">
					<!-- seat -->
				</div>
			</div>
			<span class="modal-myPick">선택좌석</span>
			<div class="modal-myPickList">
				<!-- 선택된 좌석 -->
			</div>
			<input type="button" value="확인" class="modal-seatOk">
		</div>
		<div id="modal-bottom"></div>
	</div>


	<!-- 좌석 2유형 -->
	<div id="popup-modal-container" class="type2">
		<div id="popup-modal-title">
			<span>좌석선택</span> <span class="ico-close"><i
				class="fas fa-times"></i></span>
		</div>
		<div id="popup-modal-body">
			<span class="modal-areaName">모나파크 테이블석</span> 
			<select name="areaNum" class="type2Area">
				<!-- seat_area -->
			</select>
			<div class="modal-seatList">
				<div class="zone">
					<!-- seat -->
				</div>
			</div>
			<span class="modal-myPick">선택좌석</span>
			<div class="modal-myPickList">
				<!-- 선택된 좌석 -->
			</div>
			<input type="button" value="확인" class="modal-seatOk">
		</div>
		<div id="modal-bottom"></div>

	</div>
</div>

<jsp:include page="./footer.jsp"></jsp:include>