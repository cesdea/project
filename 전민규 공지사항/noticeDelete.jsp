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
		<h1>�� �� �� �� ��</h1>
		<form name="form" method="post" action="noticeDeleteOk.jsp?n_id=<%= n_id %>&pageNum=<%= pageNum %>">
			<table>
				<tr height="50">
					<td colspan="2">
						<b> >> ��й�ȣ�� �Է��ϼ���. << </b>
					</td>
				</tr>
				<tr>
					<td width="80">���&nbsp;&nbsp;��ȣ</td>
					<td>
						<input type="password" name="n_pwd" size="12" maxlength="12">
					</td>
				</tr>
				<tr height="50" align="center">
					<td colspan="2">
						<input type="button" value="�ۻ���" onclick="delete_ok()">
						<input type="reset" value="�ٽ��ۼ�">
						<input type="button" value="�۸��" onclick="location.href='noticeList.jsp?pageNum=<%= pageNum %>'">
					</td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>
</body>
</html>