<%@page import="magic.member.CustomerDBBean"%>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="mb" class="magic.member.CustomerBean"></jsp:useBean>
<jsp:setProperty property="*" name="mb"/>
<%
	CustomerDBBean manager = CustomerDBBean.getInstance();

	if(manager.confirmID(mb.getCus_id()) == 1){
%>
		<script type="text/javascript">
			alert("�ߺ��Ǵ� ���̵� �����մϴ�.");
			//document.location.href="register.jsp";
			history.back();
		</script>
<%
	}else{
		int re = manager.insertMember(mb);
		
		if(re == 1){
%>
			<script>
				alert("ȸ�������� ���ϵ帳�ϴ�.\nȸ������ �α��� ���ּ���.");
				document.location.href="login.jsp";
			</script>
<%
		}else{
%>
			<script>
				alert("ȸ�����Կ� �����߽��ϴ�.");
				document.location.href="login.jsp";
			</script>
<%
		}
	}
%>