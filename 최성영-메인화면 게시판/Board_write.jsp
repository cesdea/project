<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String b_name = (String)session.getAttribute("cus_id");
%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<script type="text/javascript" charset="utf-8"></script>
<body>
	<form action="Board_writeOk.jsp" method="post" name="form">
		<input type="hidden" name="b_name" value="admin">
		<input type="hidden" name="b_suggest" value="0">
		<table>
			<tr>
				<td>
					제목:
				</td>
				<td>
					<input type="text" name="b_title">
				</td>
				<td>
					추천수 :
				</td>
			</tr>
			<tr>
				<td>
					내용 : 
				</td>
				<td colspan="3">
					<textarea name="b_content"  cols="65" rows="10"></textarea>
				</td>
			</tr>
			<tr align="center">
				<td colspan="4">
					사용자 비공개여부:
					yes<input type="radio" name="b_name_hidden" value="T">
					no<input type="radio" name="b_name_hidden" value="F" checked="on">
					&nbsp;&nbsp;&nbsp;&nbsp;
					헤시태그:
					<input type="text" name="b_hashtag" value="#">
				</td>
			</tr>
			<tr>
				<td colspan="4" align="center">
					<input type="submit" value="쓰기">
					<input type="button" value="취소" onclick="location.href='Board_list.jsp'">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>