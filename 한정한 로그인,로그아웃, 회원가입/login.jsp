<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<table border="1" align="center">
		<form method="post" action="loginOK.jsp">
			<tr>
				<td align="center">
					ID
				</td>
				<td>
					<input type="text" name="cus_id">
				</td>
			</tr>
			<tr>
				<td align="center">
					비밀번호
				</td>
				<td>
					<input type="password" name="cus_pwd">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="로그인">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="button" value="회원가입" onclick="javascript:window.location='register.jsp'">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="button" value="아이디 /비밀번호 찾기 " onclick="">
				</td>
			</tr>
			
		</form>
	</table>
</body>
</html>



