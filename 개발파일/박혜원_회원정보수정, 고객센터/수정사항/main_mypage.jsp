<%@page import="manager.ManagerDBBean"%>
<%@page import="customer.CustomerBean"%>
<%@page import="customer.CustomerDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
 	String cus_id=(String)session.getAttribute("cus_id");
	if(cus_id==null){
	%>
	<script type="text/javascript">
		history.go(-1);
	</script>
	<%
	}
 	String movepage=request.getParameter("movepage");
 	if(movepage==null){
 		movepage="member";
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
</head>
<link rel="stylesheet" href="CSS/bootstrap.css">
<!-- <link rel="stylesheet" href="CSS/main_memu_model.css" type="text/css"> -->
<body>
	<div style="width: 1100px; margin: 0 auto;">
		<header>
			<div class="jumbotron text-center mb-0" >
				<a href="main.jsp?cus_id=<%= cus_id %>">�ֽ� ���� ���� �Խ���</a>
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

		<section style="width: 1000px; padding-left: 50px;">
			<aside style="float: left; width: 200px;">
				<%
                   	if(cus_id!=null){
                   %>
                   	<div style="padding-top: 30px; height: 100px; width: 200px;">
                   		<p class="text-center" style="width: 170px;">�г���:<%=cb.getCus_nickname() %>(<%=cus_id %>)</p>
                   		<a href="CustomerLogOut.jsp" class="btn btn-default" style="width: 170px;">�α׾ƿ�</a>
                   	</div>
                   <%
                   	}else{
                   %>
                   	<div style="padding-top: 30px; height: 100px; width: 200px;">
                       	<a role="button" href="main_login.jsp" class="btn btn-default" style="width: 170px;">�α���</a>
                   	</div>
                   <%
                   	}
                   %>
					<div style="border: 2px solid black; border-radius: 5px; height: 200px; width: 170px; padding-top: 50px;">
						<ul>
							<li>
								<a href="main_mypage.jsp?movepage=member">ȸ������</a>
							</li>
							<li>
								<a href="main_mypage.jsp?movepage=board">�ڽ��� �Խ���</a>
							</li>
							<li>
								<a href="main_mypage.jsp?movepage=answer">���Ȱ��</a>
							</li>
							<li>
								<a href="main_mypage.jsp?movepage=delete">ȸ��Ż��</a>
							</li>
						<%
							ManagerDBBean md=ManagerDBBean.getInstance();
							if(md.checkManager(cus_id)){
							%>
								<li>
									<a href="main_mypage.jsp?movepage=manager">������ ������</a>
								</li>
							<%
							}
						%>
						</ul>
					</div>
			</aside>
			<div style="float: right; width: 700px;">
				<%
				if(movepage.equals("member")){
					move="Mypage_check.jsp";
				}else if(movepage.equals("board")){
					move="Mypage_board.jsp?pageNum_board=1&pageNum_qna=1";
				}else if(movepage.equals("answer")){
					move="Mypage_answer.jsp?pageNum_board=1&pageNum_qna=1";
				}else if(movepage.equals("delete")){
					move="Mypage_delete.jsp";
				}
				if(md.checkManager(cus_id)){
					if(movepage.equals("manager")){
						move="Mypage_manager.jsp";
					}
				}
			%>
					<iframe src="<%=move %>" width="800" height="1000px" frameBorder="0" scrolling="yes" topmargin="0"></iframe>
			</div>
		</section>	
		<footer style="clear: both;">
			since 2021/10/15
		</footer>
	</div>
</body>
</html>
