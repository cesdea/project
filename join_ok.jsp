<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%> 
    

<%@ page import="magicwepapp.customBean" %>    

 
<html>
<head>
    <title>회원가입 처리 JSP</title>
    
   
</head>
<body>
    
    <% 
        
        request.setCharacterEncoding("euc-kr"); 
    %>
    
    
    <jsp:useBean id="customBean" class="magicwepapp.customBean" />
    <jsp:setProperty property="*" name="customBean"/>    
    
    <%
        customDAO dao = customDAO.getInstance();
    
        // 회원정보를 담고있는 customBean을 dao의 insertcustom() 메서드로 넘긴다.
        // insertcustom()는 회원 정보를 JSP_custom 테이블에 저장한다.
        dao.insertcustom(customBean);
    %>
    
    <div id="wrap">
        <br><br>
        <b><font size="5" color="gray">회원가입 정보를 확인하세요.</font></b>
        <br><br>
        <font color="blue"><%=customBean.getName() %></font>님 가입을 축하드립니다.
        <br><br>
        
        
        <table>
            <tr>
                <td id="title">아이디</td>
                <td><%=customBean.getId() %></td>
            </tr>
                        
            <tr>
                <td id="title">비밀번호</td>
                <td><%=customBean.getPw() %></td>
            </tr>
                    
            <tr>
                <td id="title">이름</td>
                <td><%=customBean.getName() %></td>
            </tr>
                    
            <tr>
                <td id="title">닉네임</td>
                <td><%=customBean.getNickname()%></td>
            </tr>
                    
            <tr>
                <td id="title">생년월일</td>
                <td>
                    <%=customBean.getBirthyy() %>년 
                    <%=customBean.getBirthmm() %>월 
                    <%=customBean.getBirthdd() %>일
                </td>
            </tr>
                    
            <tr>
                <td id="title">이메일</td>
                <td>
                    <%=customBean.getMail1() %>@<%=customBean.getMail2() %>
                </td>
            </tr>
                    
            <tr>
                <td id="title">휴대전화</td>
                <td><%=customBean.getPhone() %></td>
            </tr>
            <tr>
                <td id="title">주소</td>
                <td>
                    <%=customBean.getAddress() %>
                </td>
            </tr>
        </table>
        
        <br>
        <input type="button" value="확인">
    </div>
</body>
</html>
