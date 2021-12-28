<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="CSS/main_login_memu.css" type="text/css"c>
<body>
	<center>
		<header>
			<div class="left">
				<a href="main.jsp">메인보더</a>
			</div>
			<ul class="memu" >
				<li>
					<a href="main_memu.jsp?movepage=notice">공지사항</a>
				</li>
				<li>
					<a href="main_memu.jsp?movepage=border">게시판</a>
				</li>
				<li>
					<a href="main_memu.jsp?movepage=qna">QnA</a>
				</li>
				<li>
					<a href="main_memu.jsp?movepage=service">고객센터</a>
				</li>
			</ul>
			<div class="right">
				<a  href="messenger.jsp">채팅방 입장</a>
			</div>
		</header>
		<section>
			<iframe src="CustomerLogin.jsp""></iframe>
		</section>
		<footer>
			since 2021/10/15
		</footer>
	</center>
</body>
</html>