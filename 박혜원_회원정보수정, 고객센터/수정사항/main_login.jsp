<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
/* �߾� ���� */
section{
	border:1px solid black;
	width: 1000px;
	height: 600px;
	padding: 10px;
}
section iframe{
	width: 100%;
	height: 100%;
	border:1px solid black;
}
</style>
</head>
<!-- <link rel="stylesheet" href="CSS/main_login_memu.css" type="text/css"> -->
<link rel="stylesheet" href="CSS/bootstrap.css">
<body>
	<div style="width: 1100px; margin: 0 auto;">
		<header>
			<div class="jumbotron text-center mb-0" >
				<a href="main.jsp">�ֽ� ���� ���� �Խ���</a>
			</div>
			<nav class="navbar navbar-default">
				<div class="container-fluid">
					<div class="collapse navbar-collapse">
						<ul class="nav navbar-nav">
							<li>
								<a href="main_memu.jsp?movepage=notice">��������</a>
							</li>
							<li>
								<a href="main_memu.jsp?movepage=board">�Խ���</a>
							</li>
							<li>
								<a href="main_memu.jsp?movepage=qna">QnA</a>
							</li>
							<li>
								<a href="main_memu.jsp?movepage=service">������</a>
							</li>
						</ul>
						<ul class="nav navbar-nav navbar-right">
							<li>
								<a href="main_mypage.jsp">����������</a>
							</li>
						</ul>
					</div>
				</div>
			</nav>
		</header>
		<section style="margin: 0 auto;">
			<iframe src="CustomerLogin.jsp"></iframe>
		</section>
		<footer>
			since 2021/10/15
		</footer>
	</div>
</body>
</html>