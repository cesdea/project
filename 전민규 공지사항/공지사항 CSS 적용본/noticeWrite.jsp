<%@page import="customer.CustomerBean"%>
<%@page import="customer.CustomerDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<meta name="viewport" content="width-device-width", initial-scale="1">
<!-- ��Ʈ ������ ��Ʈ��Ʈ���� �����ϴ� ��ũ -->
<link rel="stylesheet" href="css/bootstrap.css">
<title>JSP �Խ��� �� ����Ʈ</title>
</head>
<body>
	<%
		// ���� �������� �̵����� �� ���ǿ� ���� ����ִ��� üũ
		String userID = (String)session.getAttribute("cus_id");
		CustomerDBBean cus=CustomerDBBean.getInstance();
		CustomerBean c= cus.getCustomer(userID);
	%>
	<!-- �Խ��� �۾��� ��� ���� ���� -->
	<div class="container">
		<div class="row">
			<form method="post" action="noticeWriteForm.jsp">
				<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
						<tr>
							<th colspan="2" style="background-color: #eeeeee; text-align: center;">�������� �� �ۼ�</th>
						</tr>
						<tr>
							<td><input type="text" class="form-control" placeholder="�� ����" name="n_title" maxlength="50"></td>
							<td><input type="text" class="form-control" name="n_name" value="<%=c.getCus_nickname() %>" readonly="readonly" maxlength="10" style="width:150px;"></td>
						</tr>
						<tr>
							<td colspan="2"><textarea class="form-control" placeholder="�� ����" name="n_content" maxlength="2048" style="height:350px; resize:none;"></textarea></td>
						</tr>
				</table>
				<!-- �۾��� ��ư ���� -->
				<div align="right">
					<input type="button" class="btn btn-primary" value="�۸��" onclick="location.href='Notice_list.jsp?'">
					<input type="submit" class="btn btn-primary" value="�۾���">
				</div>
			</form>
		</div>
	</div>
	<!-- �Խ��� �۾��� ��� ���� �� -->
</body>
</html>