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
<link rel="stylesheet" href="CSS/bootstrap.css">
</head>
<script type="text/javascript" charset="utf-8"></script>
<style>
	
</style>
<body>

<form name="form" action="Board_writeOk.jsp" method="post">


		<input type="hidden" name="b_name" value="<%=b_name%>">
		<input type="hidden" name="b_suggest" value="0">
   
	<input type="text" name="b_title" class="form-control mt-4 mb-2"
		placeholder="제목을 입력해주세요." required
	>
	<div class="form-group">
		<textarea class="form-control" rows="10" name="b_content"
			placeholder="내용을 입력해주세요" required
		></textarea>
	</div>
	사용자 비공개여부:
					yes<input type="radio" name="b_name_hidden" value="T">
					no<input type="radio" name="b_name_hidden" value="F" checked="on">
					&nbsp;&nbsp;&nbsp;&nbsp;
					헤시태그:
					<input type="text" name="b_hashtag" value="#">
	                <input type="submit" value="쓰기">
					<input type="button" value="취소" onclick="location.href='Board_list.jsp'">
	
</form>



	<%-- <form action="Board_writeOk.jsp" method="post" name="form">
		<input type="hidden" name="b_name" value="<%=b_name%>">
		<input type="hidden" name="b_suggest" value="0">
		<table  width="800px" height="1000px">
			<tr>
				<td>
					제목:
				</td>
				<td>
					<input type="text" name="b_title">
				</td>
			</tr>
			<tr>
				<td>
					내용 : 
				</td>
				<td colspan="2">
					<textarea name="b_content"  cols="65" rows="10"></textarea>
				</td>
			</tr>
			<tr align="center">
				<td colspan="3">
					사용자 비공개여부:
					yes<input type="radio" name="b_name_hidden" value="T">
					no<input type="radio" name="b_name_hidden" value="F" checked="on">
					&nbsp;&nbsp;&nbsp;&nbsp;
					헤시태그:
					<input type="text" name="b_hashtag" value="#">
				</td>
			</tr>
			<tr>
				<td colspan="3" align="center">
					<input type="submit" value="쓰기">
					<input type="button" value="취소" onclick="location.href='Board_list.jsp'">
				</td>
			</tr>
		</table>
	</form> --%>
</body>
</html>