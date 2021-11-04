<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="writePro.jsp" method="post">
<table border="1">
<tr><td>작성자 </td></tr><input type="text" name="name">
<tr><td>제목</td></tr><input type="text" name="title">
<tr><td>내용</td>
<td><textarea rows="10" cols="20" name="content"></textarea></td></tr>
<tr><td colspan="2"> <input type="submit" value="글쓰기"></td></tr>  
</table>
</form>
</body>
</html>