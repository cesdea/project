<%@page import="portfolio.customer.CustomerDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="customer" class="portfolio.customer.CustomerBean"></jsp:useBean>
<jsp:setProperty property="*" name="customer" />
	<%
		String uid = (String) session.getAttribute("uid"); //세션 이름 로그인할 때 만들어질 세션 이름이랑 맞출 것
			customer.setCus_id(uid);		
			CustomerDBBean manager = CustomerDBBean.getInstance();
			int re = manager.updateCustomer(customer);	
			 
			if(re == 1){
	%>
			<script type="text/javascript">
				alert("입력하신대로 회원 정보가 수정되었습니다.");
				document.location.href="main.jsp";
			</script>
	<%
		}else{
	%>
			<script type="text/javascript">
				alert("수정이 실패되었습니다.");
				history.go(-1);
			</script>
	<%		
		}
	%>	