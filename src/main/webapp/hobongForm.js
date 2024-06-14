//addHobong스크립트
function check(){
		if(document.form.salary.value==""){
			alert("급여가 입력되지 않았습니다.");
			document.form.code.focus();
			return false;
		}
		document.form.submit();
	}