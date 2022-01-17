<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="modify" method="post">
		<table class="table table-striped">
			<input type="hidden" id="writer" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<tr>
				<th>아이디</th>
				<td><input type="text" name="id" id="" value="${dto.id }" readonly/> </td>
				<th>비번</th>
				<td><input type="password" name="pwd" id="" value="${dto.pwd }"/></td>
			</tr>
			
			<tr>
				<th>이름</th>
				<td><input type="text" name="mem_name" id="" value="${dto.mem_name }" readonly/></td>
				<th>생년월일</th>
				<td><input type="text" name="mem_birth" id="" value="${dto.mem_birth }" readonly/></td>
			</tr>
			
			<tr>
				<th>전화번호</th>
				<td><input type="text" name="mp" id="" value="${dto.mp } "readonly/></td>
				<th>메일</th>
				<td><input type="text" name="mail" id="" value="${dto.mail } "/></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input type="text" name="addrs" id="" value="${dto.addrs }"readonly/></td>
			</tr>
			<tr>
				<td colspan="4">
					<input type="submit" value="수정하기" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>