<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<!-- ȭ�� ����ȭ -->
<meta name="viewport" content="width-device-width", initial-scale="1">
<!-- ��Ʈ ������ ��Ʈ��Ʈ���� �����ϴ� ��ũ -->
<link rel="stylesheet" href="css/bootstrap.css">
<title>JSP �Խ��� �� ����Ʈ</title>
</head>
<body>
	<%
		// ���� �������� �̵����� �� ���ǿ� ���� ����ִ��� üũ
		String userID = null;
		if(session.getAttribute("cus_ID") == null){
			userID = (String)session.getAttribute("cus_ID");
		}
	%>
	<nav class="navbar navbar-default"> <!-- �׺���̼� -->
		<div class="navbar-header"> 	<!-- �׺���̼� ��� �κ� -->
			<!-- �׺���̼� ��� �ڽ� ���� -->
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<!-- �� ���� ��ư�� ȭ���� �������� ������ ��Ÿ���� -->
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<!-- ��� �ٿ� ������ ��Ÿ���� Ŭ���ϸ� main �������� �̵��Ѵ� -->
			<a class="navbar-brand" href="main.jsp">JSP �Խ��� �� ����Ʈ</a>
		</div>
		<!-- �Խ��� ���� �̸� ���� ��Ÿ���� �޴� ���� -->
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="main.jsp">����</a></li>
				<li class="active"><a href="noticeList.jsp">�Խ���</a></li>
			</ul>
			<%
				// �α��� ���� �ʾ��� �� �������� ȭ��
				if(userID == null){
			%>
			<!-- ��� ������ ��Ÿ���� ����ٿ� ���� -->
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">�����ϱ�<span class="caret"></span></a>
					<!-- ����ٿ� ������ ���� -->	
					<ul class="dropdown-menu">
						<li><a href="login.jsp">�α���</a></li>
						<li><a href="register.jsp">ȸ������</a></li>
					</ul>
				</li>
			</ul>
			<%
				// �α����� �Ǿ� �ִ� ���¿��� �����ִ� ȭ��
				}else{
			%>
			<!-- ��� ������ ��Ÿ���� ����ٿ� ���� -->
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">ȸ������<span class="caret"></span></a>
					<!-- ����ٿ� ������ ���� -->	
					<ul class="dropdown-menu">
						<li><a href="logoutAction.jsp">�α׾ƿ�</a></li>
					</ul>
				</li>
			</ul>
			<%
				}
			%>
		</div>
	</nav>
	<!-- �׺���̼� ���� �� -->
	
	<!-- �Խ��� �۾��� ��� ���� ���� -->
	<div class="container">
		<div class="row">
			<form method="post" action="noticeWriteForm.jsp">
				<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="2" style="background-color: #eeeeee; text-align: center;">�������� �� �ۼ�</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" class="form-control" placeholder="�� ����" name="n_title" maxlength="50"></td>
							<td><input type="text" class="form-control" placeholder="����ڸ�" name="n_name" maxlength="10" style="width:150px;"></td>
						</tr>
						<tr>
							<td><textarea class="form-control" placeholder="�� ����" name="n_content" maxlength="2048" style="height:350px;"></textarea></td>
						</tr>
					</tbody>
				</table>
				<!-- �۾��� ��ư ���� -->
				<input type="submit" class="btn btn-primary pull-right" value="�۾���">
			</form>
		</div>
	</div>
	<!-- �Խ��� �۾��� ��� ���� �� -->
	
	<!-- ��Ʈ��Ʈ�� ���� ���� -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>