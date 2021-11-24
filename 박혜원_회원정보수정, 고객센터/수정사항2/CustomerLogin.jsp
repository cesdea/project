<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

<style type="text/css">
@charset "UTF-8";

/* reset */ /* 예측못한 공간과 설정들  다 다시 설정 */


.clearfix::after{
    content:""; /* 빈공간 설정 */
    display:block;
    clear:both;
}
table{position: relative;
    top: 240px;
    left: 0;
}
table .id{}
table .id .a{}
table .id .text{
   
}
table .id .text .input{
    
    border-left: none;
    border-right: none;
    border-top: none;
    border-bottom: none;
}
table .number{}
table .number .num{}
table .number .pass{}
table .submit{}
table .submit .tr{
    background:#A2D2FF;
    
}
table .submit .tr .log{
    width: 100%;
    border-left: none;
    border-right: none;
    border-top: none;
    border-bottom: none;
    background:#A2D2FF;
    color:#FEF9EF;
   

}
table .submit .tr .log:hover{
    color: #999;
}
table .button{}
table .button .td{
    background:#A2D2FF;
}
table .button .td .bu{
    width: 100%;
    border-left: none;
    border-right: none;
    border-top: none;
    border-bottom: none;
    background:#A2D2FF;
    color:#FEF9EF;
}

table .button .td .bu:hover{
    color: #999;
}

</style>
    <link rel="stylesheet" href="CSS/bootstrap.css">
</head>
<body>
	<div class="container">	
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<form class="form-signin" action="CustomerLoginOK.jsp" method="get">
		    <h1 class="h3 mb-3 fw-normal">Please sign in</h1>
		    <label for="inputId" class="visually-hidden">ID</label>
		    <input type="text" id="inputId" name="cus_id" class="form-control" placeholder="ID" required autofocus>
		    <label for="inputPassword" class="visually-hidden">Password</label>
		    <input type="password" id="inputPassword" name="cus_pwd" class="form-control" placeholder="Password" required>
		    <div class="checkbox mb-3">
		        <input class="btn btn-link" type="button" value="회원가입" onclick="javascript:window.location='CustomerRegister.jsp'">
		        <input class="btn btn-link" type="button" value="아이디 /비밀번호 찾기 "  onclick="javascript:window.location='CustomerFind.jsp'">
		    </div>
		    <button class="w-100 btn btn-lg btn-primary" type="submit">Sign in</button>
		    <p class="mt-5 mb-3 text-muted">&copy; 2017-2020</p>
  		</div>
  	</div>
  </form>
		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
   <script src="js/bootstrap.js"></script>
</body>
</html>