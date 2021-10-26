function update_check_ok(){
	if(document.reg_frm.cus_pwd.value.length == 0){
		alert("비밀번호는 반드시 입력해야 합니다.");
		reg_frm.cus_pwd.focus();
		return;
	}
	if(document.reg_frm.cus_pwd.value != document.reg_frm.pwd_check.value){
		alert("비밀번호가 일치하지 않습니다.");
		reg_frm.cus_pwd.focus();
		return;
	}
	if(document.reg_frm.cus_email.value.length == 0){
		alert("이메일을 써주세요.");
		reg_frm.cus_email.focus();
		return;
	}
	
	document.reg_frm.submit();
}
