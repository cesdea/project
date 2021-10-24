<%@page import="portfolio.customer.CustomerBean"%>
<%@page import="portfolio.customer.CustomerDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

	<%
		String id = request.getParameter("cus_id");
		String pwd = request.getParameter("cus_pwd");
		CustomerDBBean db = CustomerDBBean.getInstance();
		
		int check2 = db.manCheck(id, pwd);
		CustomerBean manager = db.getManager(id);

		int check = db.userCheck(id , pwd);
		CustomerBean customer = db.getCustomer(id);
		
		/*관리자 계정 로그인*/
		if(manager == null){
	%>
			<script type="text/javascript">
				alert("존재하지 않는 회원");
				history.go(-1);
			</script>
	<%
		}else{
			String name = manager.getMan_name();
			if(check2 == 1){
				session.setAttribute("id", id);
				session.setAttribute("nickname", name);
				session.setAttribute("Member", "yes");
				response.sendRedirect("main.jsp");
			}else if(check2 == 0){
	%>
			<script type="text/javascript">
				alert("비밀번호가 맞지 않습니다.");
				history.go(-1);
			</script>
	<%
			}else{ 
	%>
			<script type="text/javascript">
				alert("아이디가 맞지 않습니다.");
				history.go(-1);
			</script>
	<%
			}
		}
	

		/*사용자 계정 로그인*/
		if(customer == null){
	%>
			<script type="text/javascript">
				alert("존재하지 않는 회원");
				history.go(-1);
			</script>
	<%
		}else{
			String name = customer.getCus_nickname();
			if(check == 1){
				session.setAttribute("id", id);
				session.setAttribute("nickname", name);
				session.setAttribute("Member", "yes"); //인증되지않은 사용자가 바로 main.jsp로 들어가는것 방지하기 위해서
				response.sendRedirect("main.jsp");
			}else if(check == 0){
	%>
			<script type="text/javascript">
				alert("비밀번호가 맞지 않습니다.");
				history.go(-1);
			</script>
	<%
			}else{ 
	%>
			<script type="text/javascript">
				alert("아이디가 맞지 않습니다.");
				history.go(-1);
			</script>
	<%
			}
		}
	%>
