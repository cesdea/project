/*고객센터 글 작성 유효성 검사*/
/*고객센터 글 수정 유효성 검사*/
function check_ok(){
	if(document.form.s_content.value.length == 0){
		alert("글내용을 작성해주세요.");
		form.s_content.focus();
		return;
	}
	
	document.form.submit();
}

/*고객센터 답변 글 작성 유효성 검사*/
/*고객센터 답변 글 수정 유효성 검사*/
function check_ok2(){
	if(document.form2.s_a_content.value.length == 0){
		alert("글내용을 작성해주세요.");
		form2.s_a_content.focus();
		return;
	}
	
	document.form2.submit();
}

