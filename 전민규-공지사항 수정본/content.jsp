<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
Class.forName("oracle.jdbc.driver.OracleDriver");
String url="jdbc:oracle:thin:@localhost:1521:xe";
String userid="c##stock";
String password="1234";

Connection con=DriverManager.getConnection(url, userid, password);

String sql="select * from notice order by num desc" ;

PreparedStatement pstmt=con.prepareStatement(sql);

ResultSet rs=pstmt.executeQuery();

%>

<table border="1">

<tr>
<td>순번 </td>
<td>작성자</td>
<td>제목</td>
<td>내용</td>
</tr>

<%

while(rs.next()){

%>

<tr><td><%=rs.getInt("num")%> </td>

<td><a href="content.jsp? num=<%=rs.getInt("num")%>"><%=rs.getString("title")%></a></td>

<td><%=rs.getString("name")%> </td>
<td><%=rs.getString("content")%> </td></tr><% 




}
%> 

</body>
</html>