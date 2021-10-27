<%@page import="board.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="board" class="board.BoardBean"></jsp:useBean>
<jsp:setProperty property="*" name="board"/>
<%
	BoardDBBean boardDB=BoardDBBean.getInstance();
	int r=boardDB.insertBoard(board);
	if(r==0){
	%>
		<script type="text/javascript">
			alert("입력이 되지 않았습니다.");
			history.go(-1);
		</script>
	<%
	}else{
	%>
		<script type="text/javascript">
			alert("입력에 성공했습니다.");
		</script>
	<%
		response.sendRedirect("Board_list.jsp");
	}
	
	
%>
</body>
</html>