function check_ok(){
	//if(document.reg_frm.cus_id.value == ""){
	if(reg_frm.cus_id.value.length == 0){
		alert("아이디를 써주세요.");
		reg_frm.cus_id.focus();
		return;
	}
	if(document.reg_frm.cus_id.value.length < 4){
		alert("아이디는 4글자 이상이어야 합니다.");
		reg_frm.cus_id.focus();
		return;
	}
	if(document.reg_frm.cus_pwd.value.length == 0){
		alert("패스워드는 반드시 입력해야 합니다.");
		reg_frm.cus_pwd.focus();
		return;
	}
	if(document.reg_frm.cus_pwd.value != document.reg_frm.pwd_check.value){
		alert("패스워드가 일치하지 않습니다.");
		reg_frm.pwd_check.focus();
		return;
	}
	if(reg_frm.cus_nickname.value.length == 0){
		alert("이름을 써주세요.");
		reg_frm.cus_nickname.focus();
		return;
	}
	if(reg_frm.cus_email.value.length == 0){
		alert("Email을 써주세요.");
		reg_frm.cus_email.focus();
		return;
	}
	document.reg_frm.submit();
}















