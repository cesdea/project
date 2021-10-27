<%@page import="java.util.ArrayList"%>
<%@page import="board.Board_AnswerDBBean"%>
<%@page import="board.Board_AnswerBean"%>
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
	//String cus_id=(String)session.getAttribute("cus_id");
	String cus_id="admin";
	int b_id=Integer.parseInt(request.getParameter("b_id"));
	Board_AnswerDBBean bad=Board_AnswerDBBean.getInstance();
	ArrayList<Board_AnswerBean> bal=bad.listBoard_Answer(b_id);
%>
	<table border="1">
		<form action="Board_answerOk.jsp?b_id=<%= b_id %>" method="post">
			<tr>	
				<td colspan="3">
					<textarea rows="4" cols="20" name="b_a_content"></textarea>
					<input type="submit" value="작성">
				</td>
			</tr>
			<tr>
				<td colspan="3">
					내용 글작성자에게만 보이기:
					yes<input type="radio" name="b_a_hidden" value="T">
					no<input type="radio" name="b_a_hidden" value="F" checked="on">
					 <BR>작성자 비공개여부:
					yes<input type="radio" name="b_a_name_hidden" value="T">
					no<input type="radio" name="b_a_name_hidden" value="F" checked="on">
				</td>
			</tr>
		</form>
	<%
		for(int i=0;i<bal.size();i++){
			Board_AnswerBean ba=bal.get(i);
	%>
		<Tr>
			<td colspan="2">
				<iframe src="Board_answer_list.jsp?b_id=<%=b_id%>&b_a_ref=<%=ba.getB_a_ref()%>" ></iframe>
			</td>
		</tr>
	<%
		}
	%>
	</table>
</body>
</html>