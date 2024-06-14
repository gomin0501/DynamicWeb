//addCustomer스크립트
function check(){
		if(document.form.id.value==""){
			alert("고객아이디를 입력하세요");
			document.form.id.focus();
			return false;
		}
		if(document.form.name.value==""){
			alert("고객이름을 입력하세요");
			document.form.name.focus();
			return false;
		}
		//isNaN:숫자가 아닐때
		if(document.form.ph1.value.length !=3||isNaN(document.form.ph1.value)){
			alert("전화번호를 입력하세요");
			ph1.focus();
			return false;
		}
		if(document.form.ph2.value.length !=4||isNaN(document.form.ph2.value)){
			alert("전화번호를 입력하세요");
			ph2.focus();
			return false;
		}
		if(document.form.ph3.value.length !=4||isNaN(document.form.ph3.value)){
			alert("전화번호를 입력하세요");
			ph3.focus();
			return false;
		}
		if(document.form.emailId.value==""){
			alert("이메일을 입력하세요");
			document.form.emailId.focus();
			return false;
		}
		if(document.form.emailAdd.value==""){
			alert("이메일을 입력하세요");
			document.form.emailAdd.focus();
			return false;
		}
		
		
		
		document.form.submit();
	}