<%@page import="customer.CustomerBean"%>
<%@page import="customer.CustomerDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
 	String cus_id=(String)session.getAttribute("cus_id");
	
 	String movepage=request.getParameter("movepage");
 	if(movepage==null){
 		movepage="";
 	}
 	String move=request.getParameter("move");
 	if(move==null){
 		move="";
 	}
 	
 	CustomerDBBean cdb=CustomerDBBean.getInstance();
 	CustomerBean cb=cdb.getCustomer(cus_id);
	//ArrayList<String> arrlist= cdb.getRankHashTag();
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script>
  function resizeIframe(obj) {
    obj.style.height = obj.contentWindow.document.body.scrollHeight + 'px';
  }
</script>

</head>
<link rel="stylesheet" href="CSS/bootstrap.css">
<!-- <link rel="stylesheet" href="CSS/main_memu_model.css" type="text/css"> -->
<body>
	<div style="width: 1100px; margin: 0 auto;">	
		<header>
			<div class="jumbotron text-center mb-0" >
				<a href="main.jsp?cus_id=<%= cus_id %>">주식 정보 공유 게시판</a>
			</div>
			<nav class="navbar navbar-default">
				<div class="container-fluid">
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
						<ul class="nav navbar-nav navbar-right">
							<li>
								<a href="main_mypage.jsp">마이페이지</a>
							</li>
						</ul>
					</div>
				</div>
			</nav>
		</header>

		<section style="width: 1000px; padding-left: 50px;">
			<aside style="float: left; width: 200px;">
                   <%
                   	if(cus_id!=null){
                   %>
                   	<div style="padding-top: 30px; height: 100px; width: 200px;">
                   		<p class="text-center" style="width: 170px;">닉네임:<%=cb.getCus_nickname() %>(<%=cus_id %>)</p>
                   		<a href="CustomerLogOut.jsp" class="btn btn-default" style="width: 170px;">로그아웃</a>
                   	</div>
                   <%
                   	}else{
                   %>
                   	<div style="padding-top: 30px; height: 100px; width: 200px;">
                       	<a role="button" href="main_login.jsp" class="btn btn-default" style="width: 170px;">로그인</a>
                   	</div>
                   <%
                   	}
                   %>
                   <div style="height: 100px; width: 200px;">
						<iframe src="https://sbiz.wooribank.com/biz/Dream?withyou=FXCNT0006&rc=0&divType=1&lang=KOR" frameBorder=0 scrolling=no topmargin="0" name=irate marginWidth=0 marginHeight=0 title="무료환율표A형" height="180px" width="200px"></iframe>		
                   </div>
                   <div style="margin-top: 70px; height: 100px; width: 200px;">
						<iframe src="HashTagChart.jsp" width="200" frameBorder=0 scrolling=no topmargin="0"></iframe>
                   </div>
                   <div style="margin-top: 70px; height: 100px; width: 200px;">
						sda
                   </div>
			</aside>
			<div style="float: right; width: 700px;">
			<%
				if(movepage.equals("board")){
					move="Board_list.jsp";
				}else if(movepage.equals("service")){
					move="Service_list.jsp";
				}else if(movepage.equals("qna")){
					move="QnAlist.jsp";
				}else if(movepage.equals("notice")){
					move="Notice_list.jsp";
				}
			%>
			<%--
				<jsp:include page="<%=move %>" flush="false"/>
			 --%>
					<iframe src="<%=move %>" width="800" height="1000px"  frameBorder="0" scrolling="yes" topmargin="0" ></iframe>
			</div>
		</section>	
		<footer style="clear: both;">
			since 2021/10/15
		</footer>
	</div>
</body>
</html>
