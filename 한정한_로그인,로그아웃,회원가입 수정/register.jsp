<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
	<script type="text/javascript" src="script.js" charset="utf-8" ></script>
</head>
<body>
	<table border="1">
		<form name="reg_frm" method="post" action="registerOK.jsp">
			<tr>
				<td colspan="2" align="center">
					<h1>ȸ�� ���� </h1>
				
				</td>
			</tr>
			<tr>
				<td width="80">
					User ID
				</td>
				<td>
					<input type="text" size="20" name="cus_id">*
				</td>
			</tr>
			<tr>
				<td width="80">
					��ȣ
				</td>
				<td>
					<input type="password" size="20" name="cus_pwd">*
				</td>
			</tr>
			<tr>
				<td width="80">
					��ȣ Ȯ��
				</td>
				<td>
					<input type="password" size="20" name="pwd_check">*
				</td>
			</tr>
			<tr>
				<td width="80">
					��  ��  
				</td>
				<td>
					<input type="text" size="20" name="cus_nickname">*
				</td>
			</tr>
			<tr>
				<td width="80">
					E-mail
				</td>
				<td>
					<input type="text" size="30" name="cus_email">*
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="button" value="���" onclick="check_ok()">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="reset" value="�ٽ��Է�">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="button" value="���Ծ���" onclick="javascript:window.location='login.jsp'">
				</td>
			</tr>
		</form>
	</table>
</body>
</html>






