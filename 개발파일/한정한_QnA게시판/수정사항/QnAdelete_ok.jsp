<%@page import="manager.ManagerDBBean"%>
<%@page import="qna.QnADBBean"%>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String pageNum = request.getParameter("pageNum");
	int q_id = Integer.parseInt(request.getParameter("q_id"));
	String q_pwd = request.getParameter("q_pwd");
	
	
	ManagerDBBean manager=ManagerDBBean.getInstance();
	QnADBBean db = QnADBBean.getInstance();

	/*String nickname=null;
	if(session.getAttribute("nickname")!=null){
		nickname =(String)session.getAttribute("nickname");
	}*/
	
	String cus_id=null;
	if(session.getAttribute("cus_id")!=null){
		cus_id=(String)session.getAttribute("cus_id");
	}
	
	
	int re = db.deleteBoard(q_id, q_pwd, cus_id);
	                        // 관리자가 무작위번호 입력해서 글삭제가능
	if(re == 1 || manager.checkManager(cus_id)){
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