<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	String pageNum = request.getParameter("pageNum");
	int n_id = Integer.parseInt(request.getParameter("n_id"));
%>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
	<script type="text/javascript" src="notice.js" charset="EUC-KR" ></script>
</head>
<body>
	<center>
		<h1>글 삭 제 하 기</h1>
		<form name="form" method="post" action="noticeDeleteOk.jsp?n_id=<%= n_id %>&pageNum=<%= pageNum %>">
			<table>
				<tr height="50">
					<td colspan="2">
						<b> >> 비밀번호를 입력하세요. << </b>
					</td>
				</tr>
				<tr>
					<td width="80">비밀&nbsp;&nbsp;번호</td>
					<td>
						<input type="password" name="n_pwd" size="12" maxlength="12">
					</td>
				</tr>
				<tr height="50" align="center">
					<td colspan="2">
						<input type="button" value="글삭제" onclick="delete_ok()">
						<input type="reset" value="다시작성">
						<input type="button" value="글목록" onclick="location.href='noticeList.jsp?pageNum=<%= pageNum %>'">
					</td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>
</body>
</html>