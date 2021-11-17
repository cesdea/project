<%@page import="java.sql.Timestamp"%>
<%@page import="notice.noticeBean"%>
<%@page import="notice.noticeDAO"%>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
	<script type="text/javascript"  charset="EUC-KR"></script>
</head>
<body>
	<%
	
		int n_id = Integer.parseInt(request.getParameter("n_id"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
	
		
		
		noticeDAO ndao = new noticeDAO();
	   ndao.noticeUpdate(n_id,title,content);
		
	%>
	<script>
   alert("수정을 완료했습니다.");
   location.href="http://localhost:8181/portpolio/noticeList.jsp";
</script>

</body>
</html>