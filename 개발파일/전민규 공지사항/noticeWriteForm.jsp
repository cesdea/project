<%@page import="notice.noticeBean"%>
<%@page import="notice.noticeDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		
	
		noticeDAO ndao = new noticeDAO();
		noticeBean Nb = new noticeBean();
		if(request.getParameter("n_title") != null){
			Nb.setN_title(request.getParameter("n_title"));
			Nb.setN_content(request.getParameter("n_content"));
			Nb.setN_name(request.getParameter("n_name"));
			
			ndao.insertNotice(Nb);
		
	%>
			<script type="text/javascript">
				alert("�������׿� �� ���� ��ϵǾ����ϴ�.");
				document.location.href="Notice_List.jsp";
			</script>
	<%
		}else{
	%>
			<script type="text/javascript">
				alert("������ �Է����ּ���.");
				history.go(-1);
			</script>
	<%		
		}
	%>
</body>
</html>