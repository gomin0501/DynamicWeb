//insertBoard스크립트

function check(){
		if(document.boardForm.title.value==""){
			alert("제목을 입력하세요.");
			document.boardForm.title.focus();
			return false;
		}
		if(document.boardForm.password.value==""){
			alert("비밀번호를 입력하세요.");
			document.boardForm.title.focus();
			return false;
		}
		if(document.boardForm.memo.value==""){
			alert("내용을 입력하세요.");
			document.boardForm.memo.focus();
			return false;
		}
		
		
		document.form.submit();
	}