//addSudang스크립트
function check(){
		if(document.form.id.value==""){
			alert("사번이 입력되지 않았습니다.");
			document.form.id.focus();
			return false;
		}
		
		
		if(document.form.gajok.value==""){
			alert("가족수당을 입력하세요");
			document.form.gajok.focus();
			return false;
		}
		if(document.form.jikchak.value==""){
			alert("직책수당을 입력하세요");
			document.form.jikchak.focus();
			return false;
		}
		if(document.form.gunsok.value==""){
			alert("근속수당을 입력하세요");
			documetn.form.gunsok.focus();
			return false;
		}
		if(document.form.gitasudang.value==""){
			alert("기타수당을 입력하세요");
			documetn.form.gitasudang.focus();
			return false;
		}
		form.action="sudangProcess.jsp";
	}
function changesubmit(){
		document.form.submit();
	}
	
