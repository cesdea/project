<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
 	String cus_id=request.getParameter("cus_id");
 	String movepage=request.getParameter("movepage");
 	
 	//CustomDBBean cdb=CustomDBBean.getInstance();
	//ArrayList<String> arrlist= cdb.getRankHashTag();
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="CSS/main_memu_model.css" type="text/css"c>
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
					<a href="main_memu.jsp?cus_id=<%= cus_id %>&movepage=service">������</a>
				</li>
			</ul>
			<div class="right">
				<a  href="messenger.jsp?cus_id=<%= cus_id %>">ä�ù� ����</a>
			</div>
		</header>

		<section>

			<aside>
				<table>
					<tr>
						<td>
							����������
						</td>
					</tr>
					<tr>
						<td class="exchage">
							<iframe src="https://sbiz.wooribank.com/biz/Dream?withyou=FXCNT0006&rc=0&divType=1&lang=KOR" frameBorder=0 scrolling=no topmargin="0" name=irate marginWidth=0 marginHeight=0 title="����ȯ��ǥA��"></iframe>		
						</td>
					</tr>
					<tr>
						<td>
							�α�˻���
						</td>
					</tr>
					<tr>
						<td>
							sda
						</td>
					</tr>

				</table>
			</aside>
			<content>
			<%
				String move="";
				if(movepage.equals("board")){
					move="Board_list.jsp";
				}else if(movepage.equals("service")){
					move="Service_list.jsp";
				}else if(movepage.equals("qna")){
					move="QnA_list.jsp";
				}else if(movepage.equals("notice")){
					move="Notice_list.jsp";
				}
			%>
				<iframe src="<%=move %>" width="700" height="870" scrolling="no" frameborder="0"></iframe>
			</content>
		</section>	
		<footer>
			since 2021/10/15
		</footer>
	</center>
</body>
</html>
