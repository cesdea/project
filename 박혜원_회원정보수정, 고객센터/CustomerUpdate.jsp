<%@page import="portfolio.customer.CustomerBean"%>
<%@page import="portfolio.customer.CustomerDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
	<script type="text/javascript" src="customer.js" charset="utf-8"></script>
</head>
<body>
	<%
		String id = (String)session.getAttribute("id");
		CustomerDBBean db = CustomerDBBean.getInstance();
		CustomerBean customer = db.getCustomer(id);
	%>
	<table>
		<form name="reg_frm" method="post" action="CustomerUpdateOk.jsp">
			<tr>
				<td colspan="2" align="center">
						<h1>회원 정보 변경</h1>
				</td>
			</tr>
			<tr height="40">
				<td width="120" align="center">아이디</td>
				<td><%= customer.getCus_id() %></td>
			</tr>
			<tr height="40">
				<td width="120" align="center">비밀번호</td>
				<td><input type="password" size="20" name="cus_pwd"></td>
			</tr>
			<tr height="40">
				<td width="120" align="center">비밀번호 확인</td>
				<td><input type="password" size="20" name="pwd_check"></td>
			</tr>
			<tr height="40">
				<td width="120" align="center">닉네임</td>
				<td><input type="text" size="20" name="cus_nickname" value="<%= customer.getCus_nickname() %>"></td>
			</tr>
			<tr height="40">
				<td width="120" align="center">이메일</td>
				<td><input type="text" size="20" name="cus_email" value="<%= customer.getCus_email()%>"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
						<input type="button" value="수정하기" onclick="update_check_ok()">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="reset" value="리셋">
				</td>
			</tr>
		</form>
	</table>
</body>
</html>