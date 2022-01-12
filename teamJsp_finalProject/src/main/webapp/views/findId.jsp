<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="./resources/css/find.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="./resources/js/find.js"></script>

<jsp:include page="./header.jsp"></jsp:include>

<div id="FindPage">
        <div class="FindWrap">
            <div class="findHeader">
                <div class="findHeaderLogo">
                    <img src="./resources/images/blacklogo_lg.png" alt="로고">
                </div>
            </div>
            <div class="findTextWrap">
                <label class="findText">아이디 찾기</label>
            </div>
            <div class="findContentsWrap">
                <div class="findContents">
                    <form action="" method="post">
                        <table class="findInput">
                            <tr>
                                <td>이름</td>
                                <td><input type="text" class="firstInput" name="name" id="name"></td>
                            </tr>
                            <tr>
                                <td>이메일</td>
                                <td><input type="text" name="emailId" id="emailId"></td>
                                <td>@</td>
                                <td><input type="text" name="emailAddr" id="emailAddr" readonly="readonly"></td>
                                <td>
                                    <select name="select_email" onChange="selectEmail(this)">
                                        <option value="" selected>선택하세요</option>
                                        <option value="naver.com">naver.com</option>
                                        <option value="nate.com">nate.com</option>
                                        <option value="gmail.com">gmail.com</option>
                                        <option value="hanmail.com">hanmail.com</option>
                                        <option value="icloud.com">icloud.com</option>
                                        <option value="1">직접입력</option>
                                    </select>
                                </td>
                                <td>
                                    <input type="button" class="certificationRequest" value="인증요청">
                                </td>
                            </tr>
                            <tr>
                                <td>인증번호</td>
                                <td><input type="text" name="certificationNum" id="certificationNum" disabled></td>
                                <td></td>
                                <td class="left"><input type="button" class="certificationOk" value="인증하기"></td>
                            </tr>
                            <tr class="error">
                                <td colspan="6" class="left errorMsg"></td>
                            </tr>
                            <tr>
                                <td colspan="6">
                                    <button type="button" class="idFindBtn">아이디 찾기</button>
                                </td>
                            </tr>
                        </table>
                    </form>
                </div>
            </div>
        </div>
    </div>
    
 <jsp:include page="./footer.jsp"></jsp:include>