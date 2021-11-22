function check_ok(){
	if(document.form.content.value.length == 0){
		alert("글내용을 작성해주세요.");
		form.content.focus();
		return;
	}
	
	document.form.submit();
}
function check_ok2(){
	if(document.form2.title.value.length == 0){
		alert("제목을 작성해주세요.");
		form2.title.focus();
		return;
	}
	
	document.form2.submit();
}