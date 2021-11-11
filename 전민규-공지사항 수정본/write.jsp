<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<form action="writeForm.jsp" method="post">
<table border="1">
<tr><td>작성자 </td><td><input type="text" name="name" id="name"></td></tr>
<tr><td>제목</td><td><input type="text" name="title" id="title"></td></tr>
<tr><td>내용</td>
<td><textarea rows="10" cols="20" name="content" id="content"></textarea></td></tr>
<tr><td colspan="2"> <input type="submit" value="글쓰기"></td></tr>  
</table>
</form>
</body>
</html>