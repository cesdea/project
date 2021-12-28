<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
/* 중앙 내용 */
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
			<div class="jumbotron text-center" style="max-width: none;">
				<h2>
					<a href="main.jsp" style="text-decoration: none;">
						주식 정보 공유 게시판
					</a>
				</h2>
			</div>
			<nav class="navbar navbar-default" style="max-width: none;">
				<div class="collapse navbar-collapse">
					<ul class="nav navbar-nav">
						<li>
							<a href="main_memu.jsp?movepage=notice">공지사항</a>
						</li>
						<li>
							<a href="main_memu.jsp?movepage=board">게시판</a>
						</li>
						<li>
							<a href="main_memu.jsp?movepage=qna">QnA</a>
						</li>
						<li>
							<a href="main_memu.jsp?movepage=service">고객센터</a>
						</li>
					</ul>
				</div>
			</nav>
		</header>
		<section style="margin: 0 auto;">
			<iframe src="CustomerLogin.jsp"></iframe>
		</section>
		<footer class="text-center" style="clear: both; padding-top:30px; height: 100px; background-color: #eee;">
			<span><b>TEL</b>: 051-000-0000</span>&nbsp;&nbsp;
			<span><b>FAX</b>: +82 2-000-0000</span>&nbsp;&nbsp;
			<span><b>E-MAIL</b>: abc@gmail.com</span>
			<p>Copyright &copy; Team5. All rights reserved.</p>
		</footer>
	</div>
</body>
</html>