
<%@page import="customer.CustomerBean"%>
<%@page import="customer.CustomerDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String id = request.getParameter("cus_id");
	String pwd = request.getParameter("cus_pwd");
	CustomerDBBean manager = CustomerDBBean.getInstance();
	int check = manager.customerCheck(id, pwd);
	CustomerBean mb = manager.getCustomer(id);
	
	if(mb == null){
%>
		<script>
			alert("존재하지 않는 회원");
			history.go(-1);
		</script>
<%
	}else{
		String nickname = mb.getCus_nickname();
		
		if(check == 1){
			session.setAttribute("cus_id", id);
			session.setAttribute("nickname", nickname);
			session.setAttribute("Member", "yes");
		%>
			<script type="text/javascript">
				parent.location.href="main.jsp";
			</script>
		<%
		}else if(check == 0){
%>
			<script>
				alert("비밀번호가 맞지 않습니다.");
				history.go(-1);
			</script>
<%
		}else{	/*실제 테스트시에는 이 케이스는 제외됨*/
%>
			<script>
				alert("아이디가 맞지 않습니다.");
				history.go(-1);
			</script>
<%
		}
	}
%>






