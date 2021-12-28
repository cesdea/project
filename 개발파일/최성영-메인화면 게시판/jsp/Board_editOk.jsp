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
	int b_id=Integer.parseInt(request.getParameter("b_id"));
	board.setB_ID(b_id);
	BoardDBBean bd=BoardDBBean.getInstance();
	int re=bd.editBoard(board);
	if(re==1){
	%>
		<script type="text/javascript">
			alert("수정이 성공했습니다.");
			location.href="Board_show.jsp?b_id=<%=b_id%>";
		</script>
	<%
	}else{
	%>
		<script type="text/javascript">
			alert("수정에 실패했습니다.");
			history.go(-1);
		</script>
	<%
	}
	
%>
</body>
</html>