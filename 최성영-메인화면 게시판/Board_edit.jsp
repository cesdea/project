<%@page import="board.BoardBean"%>
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
<%
	int b_id=Integer.parseInt(request.getParameter("b_id"));
	//String cus_id=(String)session.getAttribute("cus_id");
	String cus_id="admin";
	BoardDBBean boardDBBean=BoardDBBean.getInstance();
	BoardBean boardBean=boardDBBean.getBoard(b_id);
%>
<form action="Board_editOk.jsp?b_id=<%= b_id %>" method="post" name="form">
		<table>
			<tr>
				<td>
					제목:
				</td>
				<td>
					<input type="text" name="b_title" value="<%= boardBean.getB_title() %>">
				</td>
				<td>
					추천수 :
				</td>
				<td>
					<%= boardBean.getB_suggest() %>
				</td>
			</tr>
			<tr>
				<td>
					내용 : 
				</td>
				<td colspan="3">
					<textarea name="b_content"  cols="65" rows="10"><%=boardBean.getB_content()%></textarea>
				</td>
			</tr>
			<tr align="center">
				<td colspan="4">
					사용자 비공개여부:
					yes<input type="radio" name="b_name_hidden" value="T">
					no<input type="radio" name="b_name_hidden" value="F" checked="on">
					&nbsp;&nbsp;&nbsp;&nbsp;
					헤시태그:
					<input type="text" name="b_hashtag" value="<%= boardBean.getB_hashtag() %>" >
				</td>
			</tr>
			<tr>
				<td>
					비밀번호:
				</td>
				<td>
					<input type="text" name="cus_pwd">
				</td>
			</tr>
			<tr>
				<td colspan="4" align="center">
					<input type="submit" value="수정">
					<input type="button" value="취소" onclick="history.go(-1)">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>