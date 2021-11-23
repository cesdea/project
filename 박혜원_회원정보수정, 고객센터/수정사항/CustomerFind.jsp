<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
	td{
		height: 50px;
	}
	#text{
		width: 200px;
	}
	.text-left{
		width: 100px;
	}
</style>
</head>
<link rel="stylesheet" href="CSS/bootstrap.css" type="text/css">
<body>
	<div style="text-align: center; padding-top: 100px;">
		<table style="display: inline-block; margin: 30px;">
			<form class="form-horizontal" method="post" action="SendEamil.jsp">
				<tr>
					<td class="text-center" colspan="2">
						<h1>아이디 찾기</h1>
					</td>
				</tr>
				<tr>
					<td class="text-left">
						닉네임
					</td>
					<td id="text">
						<input class="form-control" type="text" name="cus_nickname">
					</td>
				</tr>
				<tr>
					<td class="text-left">
						이메일
					</td>
					<td id="text">
						<input class="form-control" type="text" name="cus_email">
					</td>
				</tr>			
				<tr>
					<td></td>
				</tr>			
				<tr>
					<td class="text-center" colspan="2">
						<input class="btn btn-default" type="submit" value="찾기">
					</td>
				</tr>
			</form>
		</table>
		<table style="display: inline-block; margin: 30px;">
			<form class="form-horizontal" method="post" action="#">
				<tr>
					<td colspan="2">
						<h1>비밀번호 찾기</h1>
					</td>
				</tr>
				<tr>
					<td class="text-left">
						아이디
					</td>
					<td id="text">
						<input class="form-control" type="text" name="cus_id">
					</td>
				</tr>
				<tr>
					<td class="text-left">
						닉네임
					</td>
					<td id="text">
						<input class="form-control" type="text" name="cus_nickname">
					</td>
				</tr>
				<tr>
					<td class="text-left">
						이메일
					</td>
					<td id="text">
						<input class="form-control" type="text" name="cus_email">
					</td>
				</tr>			
				<tr>
					<td colspan="2">
						<input class="btn btn-default" type="submit" value="찾기">
					</td>
				</tr>			
			</form>
		</table>
	</div>
</body>
</html>