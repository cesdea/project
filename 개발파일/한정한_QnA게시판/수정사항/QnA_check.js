function check_ok(){
/*	if(document.form.q_name.value.length==0){
		alert("이름을 입력하세요.");
		form.q_name.focus();
		return;
	}*/
	if(document.form.q_title.value.length==0){
		alert("제목을 입력하세요.");
		form.q_title.focus();
		return;
	}
	if(document.form.q_content.value.length==0){
		alert("내용을 입력하세요.");
		form.q_content.focus();
		return;
	}
	if(document.form.q_pwd.value.length<4){
		alert("비밀번호를 입력하세요.(4개)");
		form.q_pwd.focus();
		return;
	}
	
	
	document.form.submit();
}

function login_check(){ 
         var uid = '<%=(String)session.getAttribute("id")%>';

          if(uid=="null"){ 
             swal("로그인이 필요한 항목입니다.","회원 가입 또는 로그인을 해주세요", "error"); 
          }
          else{
             location.replace("/QnA/qnalist.jsp");
          }
    }   



function delete_ok(){
	if(document.form.q_pwd.value.length==0){
		alert("비밀번호를 입력하세요.");
		form.q_pwd.focus();
		return;
	}
	document.form.submit();
}


