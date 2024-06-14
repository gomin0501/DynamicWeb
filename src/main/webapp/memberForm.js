//addMember스크립트
const email=document.querySelector('#emailList')
const emailInput=document.querySelector('#emailInput')

email.addEventListener('change',(event)=>{
	if(event.target.value !=="type"){
		emailInput.value=event.target.value;
		emailInput.disabled=true;
	}else{
		emailInput.value="";
		emailInput.disabled=false;
	}
})

function check(){
		if(document.form.name.value==""){
			alert("이름을 입력하세요.");
			document.form.name.focus();
			return false;
		}
		
		if(document.form.password.value==""){
			alert("비밀번호를 입력하세요.");
			document.form.password.focus();
			return false;
		}
		if(document.form.psCheck.value==""){
			alert("확인 비밀번호를 입력하세요.");
			document.form.psCheck.focus();
			return false;
		}
		if(document.form.password.value != document.form.psCheck.value){
			alert("비밀번호를 동일하게 입력하세요.")
		}
		
		if(document.form.year.value==""){
			alert("생일을 입력하세요");
			document.form.year.focus();
			return false;
		}
		if(document.form.emailId.value==""){
		alert("이메일을 입력하세요");
		document.form.emailId.focus();
		return false;
	}	
	if(document.form.ph1.value.length !=3||isNaN(document.form.ph1.value)){
		alert("전화번호를 입력하세요");
		document.form.ph1.focus();
		return false
	}
	if(document.form.ph2.value.length !=4||isNaN(document.form.ph2.value)){
		alert("전화번호를 입력하세요");
		document.form.ph2.focus();
		return false
	}
	if(document.form.ph3.value.length !=4||isNaN(document.form.ph3.value)){
		alert("전화번호를 입력하세요");
		document.form.ph3.focus();
		return false
	}
	if(document.form.address.value==""){
		alert("주소를 입력하세요");
		document.form.address.focus();
		return false
	}
		document.form.submit();
	}