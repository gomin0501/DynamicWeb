//addArea스크립트
function check(){
		if(document.form.code.value==""){
			alert("코드를 입력하세요");
			document.form.code.focus();
			return false;
		}
		if(document.form.name.value==""){
			alert("거주지를 입력하세요");
			document.form.name.focus();
			return false;
		}
		document.form.submit();
	}