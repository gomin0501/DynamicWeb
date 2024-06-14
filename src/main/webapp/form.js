/**
 * addMember스크립트
 */
const check=document.querySelector(".check");
const id=document.getElementById("id");
const name=document.getElementById("name");
const ps=document.getElementById("ps");
const pscheck=document.getElementById("pscheck");
const email=document.getElementById("email");
const ph1=document.getElementById("ph1");
const ph2=document.getElementById("ph2");
const ph3=document.getElementById("ph3");
const address=document.getElementById("address");

check.addEventListener("click",()=>{
	if(id.value==""){
		alert("아이디를 입력하세요");
		id.focus();
		return false;
	}
	if(name.value==""){
		alert("이름을 입력하세요");
		name.focus();
		return false;
	}
	if(ps.value==""){
		alert("비밀번호를 입력하세요");
		ps.focus();
		return false;
	}
	if(pscheck.value==""){
		alert("비밀번호 확인을 입력하세요");
		pscheck.focus();
		return false;
	}
	if(ps.value != pscheck.value){
		alert("비밀번호와 비밀번호 확인이 일치하지 않습니다")
	}
	let cnt=0;
	let rdo=document.getElementsByName("gender");
	for(let i=0;i<rdo.length;i++){
	if(rdo[i].checked==true){
		cnt++;
		break;
		}
	}
	if(cnt==0){
		alert("성별을 체크하세요.");
		return false;
	}
	if(email.value==""){
		alert("이메일을 입력하세요");
		email.focus();
		return false;
	}	
	if(ph1.value.length !=3||isNaN(ph1.value)){
		alert("전화번호를 입력하세요");
		ph1.focus();
		return false
	}
	if(ph2.value.length !=4||isNaN(ph2.value)){
		alert("전화번호를 입력하세요");
		ph2.focus();
		return false
	}
	if(ph3.value.length !=4||isNaN(ph3.value)){
		alert("전화번호를 입력하세요");
		ph3.focus();
		return false
	}
	if(address.value==""){
		alert("주소를 입력하세요");
		address.focus();
		return false
	}
	
	document.form.submit();
	})
		
	