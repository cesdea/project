<%@page import="magic.QnA.QnADBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String pageNum = request.getParameter("pageNum");
	int b_id = Integer.parseInt(request.getParameter("b_id"));
	String b_pwd = request.getParameter("b_pwd");
	
	QnADBBean db = QnADBBean.getInstance();

	
	
	
	
	
	int re = db.deleteBoard(b_id, b_pwd);
	
	if(re == 1){
		response.sendRedirect("QnAlist.jsp?pageNum="+pageNum);
	}else if(re == 0){
%>
			<script type="text/javascript">
				alert("��й�ȣ�� ���� �ʽ��ϴ�.");
				history.go(-1);
			</script>
		<%
	}else if(re == -1){
		%>
			<script type="text/javascript">
				alert("������ �����Ͽ����ϴ�.");
				history.go(-1);
			</script>
		<%
	}
%>