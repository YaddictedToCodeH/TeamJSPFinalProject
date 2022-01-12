<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="./resources/css/register.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="./resources/js/register.js"></script>

<jsp:include page="./header.jsp"></jsp:include>

 <div id="register">
    <div class="registerHeaderLogo">
        <img src="./resources/images/blacklogo_lg.png" alt="로고">
        <h2>회원 가입</h2>
    </div>
    <form name="registerOk" action="./registerOk" method="post">
        <table>
            <tr>
                <td>
                    <h6>아이디</h6>
                    <p class="idP"></p>
                </td>
            </tr>
            <tr>
                <td><input type="text" name="id" id="id"></td>
                <td><input type="button" value="중복확인" id="checkId"></td>
            </tr>

            <tr>
                <td>
                    <h6>비밀번호</h6>
                    <p class="pw1P"></p>
                </td>
            </tr>
            <tr>
                <td><input type="password" name="pw" id="pw"></td>
            </tr>

            <tr>
                <td>
                    <h6>비밀번호 확인</h6>
                    <p class="pw2P"></p>
                </td>
            </tr>
            <tr>
                <td><input type="password" name="pwOk" id="pwOk"></td>
            </tr>

            <tr>
                <td>
                    <h6>이름</h6>
                    <p class="nameP"></p>
                </td>
            </tr>
            <tr>
                <td><input type="text" name="name" id="name"></td>
            </tr>

            <tr>
                <td>
                    <h6>주민등록번호</h6>
                    <p class="birthP"></p>
                </td>
            </tr>
            <tr>
                <td>
                    <input type="text" name="birth" id="birth"><span class="sign"> -</span>
                    <input type="text" name="genderNum" id="genderNum"><span class="sign"> X X X X X X</span>
                    <span class="sign gender"></span>
                </td>
            </tr>

            <tr>
                <td>
                    <h6>휴대폰 번호</h6>
                    <p class="phoneP"></p>
                </td>
            </tr>
            <tr>
                <td>
                    <input type="text" name="phone1" id="phone1"><span class="sign"> -</span>
                    <input type="text" name="phone2" id="phone2"><span class="sign"> -</span>
                    <input type="text" name="phone3" id="phone3">
                </td>
            </tr>

            <tr>
                <td>
                    <h6>E-mail</h6>
                    <p class="mailP"></p>
                </td>
            </tr>

            <tr>
                <td>
                    <input type="text" name="mailId" id="mailId"><span class="sign">@</span>
                    <input type="text" name="mailAddress" id="mailAddress">
                </td>
                <td><input type="button" value="인증하기" id="sendMail"></td>
            </tr>

            <tr>
                <td>
                    <h6>이메일 인증번호</h6>
                    <p class="checkMailP"></p>
                </td>
            </tr>
            
            <tr>
                <td>
                    <input type="text" name="certificationNum" id="certificationNum">
                </td>
                <td><input type="button" value="확인" id="checkMail"></td>
            </tr>


            <tr>
                <td>
           			<input type="checkbox" name="mailOk" id="mailOk" <c:if test="${not empty check3 }">checked="checked"</c:if>>
           			<label for="mailOk">&nbsp;광고성 메일 수신 동의</label>                		
                </td>
            </tr>

            <tr>
                <td>
                    <h6>주소</h6>
                    <p class="addrP"></p>
                </td>
            </tr>

            <tr>
                <td>
                    <input type="text" name="addrNum" id="addrNum" readonly="readonly">
                    <input type="button" value="주소 찾기" id="findAddr">
                </td>
            </tr>

            <tr>
                <td>
                    <input type="text" name="addr1" id="addr1" readonly="readonly">
                </td>
            </tr>

            <tr>
                <td>
                    <input type="text" name="addr2" id="addr2">
                </td>
            </tr>

            <tr class="submitBtn">
                <td colspan="2"><input type="button" value="회원가입" id="registerOk"></td>
            </tr>

        </table>
    </form>

</div>

<jsp:include page="./footer.jsp"></jsp:include>