<%@page import="customer.CustomerBean"%>
<%@page import="customer.CustomerDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String cus_id = (String)session.getAttribute("cus_id");
	String nickname = (String)session.getAttribute("nickname");
	CustomerDBBean cdb=CustomerDBBean.getInstance();
 	CustomerBean cb=cdb.getCustomer(cus_id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="CSS/bootstrap.css">
<script type="text/javascript" src="/resource/js/bootstrap.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="/resource/js/bootstrap.js"></script>
<script src="/js/jquery.js"></script>
<body>
	<div style="width: 1100px; margin: 0 auto;">
		<header>
			<div class="jumbotron text-center" style="max-width: none;">
				<h2>
					<a href="main.jsp?cus_id=<%= cus_id %>" style="text-decoration: none;">
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
				<%
						if(cus_id!=null){
                %>
					<ul class="nav navbar-nav navbar-right">
						<li>
							<a href="main_mypage.jsp">마이페이지</a>
						</li>
					</ul>
                   	
                <%
                   	}
				%>
				</div>
			</nav>
		</header>

		<section style="width: 1000px; padding-left: 50px;">
			<aside style="float: left; width: 200px;">
                   <%
                   	if(cus_id!=null){
                   %>
                   	<div class="text-center" style="padding: 30px auto; height: 100px; width: 200px;">
                   		<p class="text-center">닉네임:<%=cb.getCus_nickname() %>(<%=cus_id %>)</p>
                   		<a href="CustomerLogOut.jsp" class="btn btn-default" style="width: 170px;">로그아웃</a>
                   	</div>
                   <%
                   	}else{
                   %>
                   	<div class="text-center" style="padding-top: 30px; height: 100px; width: 200px;">
                       	<a role="button" href="main_login.jsp" class="btn btn-default" style="width: 170px;">로그인</a>
                   	</div>
                   <%
                   	}
                   %>
                   <div style="padding-left: 15px; height: 100px; width: 200px;">
						<iframe src="https://sbiz.wooribank.com/biz/Dream?withyou=FXCNT0006&rc=0&divType=1&lang=KOR" frameBorder=0 scrolling=no topmargin="0" name=irate marginWidth=0 marginHeight=0 title="무료환율표A형" height="180px" width="200px"></iframe>		
                   </div>
                   <div style="margin-top: 100px; height: 300px; width: 200px;">
						<iframe src="HashTagChart.jsp" width="200" frameBorder=0 scrolling=no topmargin="0"></iframe>
                   </div>
			</aside>
			<div style="float: right; width: 700px;">
					<iframe src="news.html" width="700" height="750px"  frameBorder="0" scrolling="yes" topmargin="0" ></iframe>
			</div>
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
