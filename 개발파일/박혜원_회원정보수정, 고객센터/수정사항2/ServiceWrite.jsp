<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
	<script type="text/javascript" src="service.js" charset="utf-8"></script>
	<style type="text/css">
		tr{
			height: 50px;
		}
		table {
			margin: 20px auto;
		}
	</style>
</head>
<link rel="stylesheet" href="CSS/bootstrap.css" type="text/css">
<body>
<%	
	String s_uid = (String)session.getAttribute("cus_id");
	String s_name = (String)session.getAttribute("nickname");
	int s_id=0;
	String s_content;
	
%>
	<h1 class="text-center">������ �۾���</h1>
	<form name="form" method="post" action="ServiceWriteOk.jsp">
		<input type="hidden" name="s_id" value="<%= s_id %>">
		<input type="hidden" name="s_name" value="<%= s_name %>">
		<input type="hidden" name="s_uid" value="<%= s_uid %>">
		<table>
			<tr>
				<td>������ ���� ������ �Է��ϼ���.</td>
			</tr>
			<tr class="text-center">
				<td>
					<textarea class="form-control" style="resize: none;" rows="20" cols="80" name="s_content"></textarea>
				</td>
			</tr>
			<tr class="text-center">
				<td>
					<input class="btn btn-default" type="button" value="�۾���" onclick="check_ok()">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input class="btn btn-default" type="reset" value="�ٽ� ����">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input class="btn btn-default" type="button" value="�۸��" onclick="location.href='Service_list.jsp'">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>