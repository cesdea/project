<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	
%>
<%
	String cus_id = (String)session.getAttribute("cus_id");
	String nickname = (String)session.getAttribute("nickname");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="CSS/main_model.css" type="text/css">
<body>
	<center>
		<header>
			<div class="left">
				<a href="main.jsp?cus_id=<%= cus_id %>">���κ���</a>
			</div>
			<ul class="memu" >
				<li>
					<a href="main_memu.jsp?cus_id=<%= cus_id %>&movepage=notice">��������</a>
				</li>
				<li>
					<a href="main_memu.jsp?cus_id=<%= cus_id %>&movepage=board">�Խ���</a>
				</li>
				<li>
					<a href="main_memu.jsp?cus_id=<%= cus_id %>&movepage=qna">QnA</a>
				</li>
				<li>
					<a href="main_memu.jsp?cus_id=<%= cus_id %> && movepage=service">������</a>
				</li>
			</ul>
			<div class="right">
				<a  href="messenger.jsp?cus_id=<%= cus_id %>">ä�ù� ����</a>
			</div>
		</header>
		<content>
			<table>
				<tr>
					<td class="news" align="center" rowspan="5">
						<iframe src="news.html" width="700" height="870" scrolling="no" frameborder="0"></iframe>
					</td>
					<td>	
						<div id="login">
                        <%
                        	if(cus_id!=null){
                        %>
                        	<div>
                        		�г���:<%=nickname %>(<%=cus_id %>)<br>
                        		<a href="CustomerLogOut.jsp" id="logout">�α׾ƿ�</a>
                        	</div>
                        <%
                        	}else{
                        %>
                        	<div>
                            	<a href="main_login.jsp">�α���</a>
                        	</div>
                        <%
                        	}
                        %>
                        </div>
					</td>
				</tr>
				<tr>
					<td class="exchage">
						<iframe src="https://sbiz.wooribank.com/biz/Dream?withyou=FXCNT0006&rc=0&divType=1&lang=KOR" frameBorder=0 scrolling=no topmargin="0" 
						name=irate marginWidth=0 marginHeight=0 title="����ȯ��ǥA��"></iframe>		
					</td>
				</tr>
				<tr>
					<td class="empty"></td>
				</tr>
				<tr>
					<td class="empty"></td>
				</tr>
				<tr>
					<td class="empty"></td>
				</tr>
				<tr>
					<td class="chart">
						�α���Ʈ
					</td>
					<td class="empty">
					</td>
				</tr>
			</table>
		</content>
		<footer>
			since 2021/10/15
		</footer>
	</center>
</body>
</html>
