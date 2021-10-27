<%@page import="board.BoardBean"%>
<%@page import="board.BoardDBBean"%>
<%@page import="board.Board_AnswerBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="board.Board_AnswerDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<table border="1">
	<%
		//String cus_id=(String)session.getAttribute("cus_id");
		String cus_id="admin";
		int b_id=Integer.parseInt(request.getParameter("b_id"));
		int b_a_ref=Integer.parseInt(request.getParameter("b_a_ref"));
		String pa="";
		pa=request.getParameter("pa");
		if(pa==null){
			pa="";
		}
		if(pa.equals("reset")){
			%>
				<jsp:forward page="Board_answer_null.jsp"></jsp:forward>
			<%
		}
		
		BoardDBBean bdd=BoardDBBean.getInstance();
		BoardBean bb= bdd.getBoard(b_id);
		String b_name=bb.getB_name();
		Board_AnswerDBBean bad=Board_AnswerDBBean.getInstance();
		Board_AnswerBean ba=bad.getBoard_Answer(b_a_ref,b_id);
		%>
			<tr>
				<td>
					<%
					if(ba.getB_a_name_hidden().equals("T")){
							out.print("HIDDEN : ");
					}else{
							out.print(ba.getB_a_name()+" : ");
					}
					if(pa.equals("edit")){
					%>
						<form action="Board_answer_edit.jsp?b_a_ref=<%=ba.getB_a_ref()%>&b_id=<%=b_id%>" method="post">
							<input type="hidden" value="<%=ba.getB_a_ref()%>" name="b_a_ref">	
							<textarea rows="3" cols="20" name="b_a_content"></textarea>
							<BR><input type="submit" value="수정">
							<input type="button" value="취소" onclick="location.href='Board_answer_list.jsp?&b_id=<%=b_id%>&b_a_ref=<%= ba.getB_a_ref() %>'">
						</form>	
					<%
					}else{
						if(cus_id.equals(b_name) || cus_id.equals(ba.getB_a_name())){
							out.println(ba.getB_a_content());
						}else if(ba.getB_a_name_hidden().equals("T")){
							out.print("비공개된 내용입니다");
						}else{
							out.println(ba.getB_a_content());
						}
						if(cus_id.equals(ba.getB_a_name())){
						%>
							<BR><input type="button" value="수정" onclick="location.href='Board_answer_list.jsp?pa=edit&b_id=<%=b_id%>&b_a_ref=<%= ba.getB_a_ref() %>'">
							|<input type="button" value="삭제" onclick="location.href='Board_answer_delelte.jsp?b_a_ref=<%= ba.getB_a_ref() %>&b_id=<%=b_id%>'">
						<%
						}	
					}
					%>
				</td>
			</TR>
	</table>	
</body>
</html>