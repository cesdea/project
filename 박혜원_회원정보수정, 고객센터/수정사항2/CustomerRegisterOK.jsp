<%@page import="customer.CustomerDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="mb" class="customer.CustomerBean"></jsp:useBean>
<jsp:setProperty property="*" name="mb"/>
<%
	CustomerDBBean manager = CustomerDBBean.getInstance();
	int result = manager.customerCheck(mb.getCus_id(), mb.getCus_pwd());
	if(result == 1 || result == 0){
%>
		<script type="text/javascript">
			alert("중복되는 아이디가 존재합니다.");
			//document.location.href="register.jsp";
			history.back();
		</script>
<%
	}else{
		int re = manager.insertMember(mb);
		
		if(re == 1){
%>
			<script>
				alert("회원가입을 축하드립니다.\n회원으로 로그인 해주세요.");
				document.location.href="CustomerLogin.jsp";
			</script>
<%
		}else{
%>
			<script>
				alert("회원가입에 실패했습니다.");
				document.location.href="CustomerLogin.jsp";
			</script>
<%
		}
	}
%>