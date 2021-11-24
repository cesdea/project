<%@page import="customer.CustomerBean"%>
<%@page import="customer.CustomerDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<meta name="viewport" content="width-device-width", initial-scale="1">
<!-- 루트 폴더에 부트스트랩을 참조하는 링크 -->
<link rel="stylesheet" href="css/bootstrap.css">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
	<%
		// 메인 페이지로 이동했을 때 세션에 값이 담겨있는지 체크
		String userID = (String)session.getAttribute("cus_id");
		CustomerDBBean cus=CustomerDBBean.getInstance();
		CustomerBean c= cus.getCustomer(userID);
	%>
	<!-- 게시판 글쓰기 양식 영역 시작 -->
	<div class="container">
		<div class="row">
			<form method="post" action="noticeWriteForm.jsp">
				<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
						<tr>
							<th colspan="2" style="background-color: #eeeeee; text-align: center;">공지사항 글 작성</th>
						</tr>
						<tr>
							<td><input type="text" class="form-control" placeholder="글 제목" name="n_title" maxlength="50"></td>
							<td><input type="text" class="form-control" name="n_name" value="<%=c.getCus_nickname() %>" readonly="readonly" maxlength="10" style="width:150px;"></td>
						</tr>
						<tr>
							<td colspan="2"><textarea class="form-control" placeholder="글 내용" name="n_content" maxlength="2048" style="height:350px; resize:none;"></textarea></td>
						</tr>
				</table>
				<!-- 글쓰기 버튼 생성 -->
				<div align="right">
					<input type="button" class="btn btn-primary" value="글목록" onclick="location.href='Notice_list.jsp?'">
					<input type="submit" class="btn btn-primary" value="글쓰기">
				</div>
			</form>
		</div>
	</div>
	<!-- 게시판 글쓰기 양식 영역 끝 -->
</body>
</html>