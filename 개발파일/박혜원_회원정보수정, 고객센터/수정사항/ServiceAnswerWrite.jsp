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
	String pageNum = request.getParameter("pageNum");
	String s_a_uid = (String)session.getAttribute("cus_id");
	String s_a_name = (String)session.getAttribute("nickname");
	
	int s_a_id=0, s_a_ref=0;
	String s_a_content="";
	
	
	s_a_id = Integer.parseInt(request.getParameter("s_id"));
	
%>	
	<h1 class="text-center">������ �亯 ����</h1>
	<form name="form2" method="post" action="ServiceAnswerWriteOk.jsp?pageNum=<%= pageNum %>">
		<input type="hidden" name="s_a_id" value="<%= s_a_id %>">
		<input type="hidden" name="s_a_ref" value="<%= s_a_ref %>">
		<input type="hidden" name="s_a_name" value="<%= s_a_name %>">
		<input type="hidden" name="s_a_uid" value="<%= s_a_uid %>">
		<table>
			<tr>
				<td>������ ���� ���� �亯�� �Է��ϼ���.</td>
			</tr>
			<tr class="text-center">
				<td>
					<textarea class="form-control" rows="20" cols="80" name="s_a_content"></textarea>
				</td>
			</tr>
			<tr class="text-center">
				<td>
					<input class="btn btn-default" type="button" value="�۾���" onclick="check_ok2()">
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