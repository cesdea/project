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
<tr><td>�ۼ��� </td><td><input type="text" name="name" id="name"></td></tr>
<tr><td>����</td><td><input type="text" name="title" id="title"></td></tr>
<tr><td>����</td>
<td><textarea rows="10" cols="20" name="content" id="content"></textarea></td></tr>
<tr><td colspan="2"> <input type="submit" value="�۾���"></td></tr>  
</table>
</form>
</body>
</html>