<%@page import="qna.QnADBBean"%>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="board" class="qna.QnABean"></jsp:useBean>
<jsp:setProperty property="*" name="board"/>
<%
	String pageNum = request.getParameter("pageNum");
	int q_id = Integer.parseInt(request.getParameter("q_id"));
	
	board.setQ_id(q_id);
	QnADBBean db = QnADBBean.getInstance();
	int re = db.editBoard(board);
	
	if(re == 1){
		response.sendRedirect("QnAlist.jsp?pageNum="+pageNum);
	}else if(re == 0){
%>
			<script type="text/javascript">
				alert("비밀번호가 맞지 않습니다.");
				history.go(-1);
			</script>
		<%
	}else if(re == -1){
		%>
			<script type="text/javascript">
				alert("삭제에 실패하였습니다.");
				history.go(-1);
			</script>
		<%
	}
%>