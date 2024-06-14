//addInfo스크립트
function check(){
		if(document.form.id.value==""){
			alert("사번이 입력되지 않았습니다.");
			document.form.id.focus();
			return false;
		}
		if(document.form.name.value==""){
			alert("성명이 입력되지 않았습니다.");
			document.form.name.focus();
			return false;
		}
		let cnt=0;
		let rdo=document.getElementsByName("position");
		for(let i=0;i<rdo.length;i++){
			if(rdo[i].checked==true){
				cnt++;
				break;
			}
		}
		if(cnt==0){
			alert("직급을 선택하세요.");
			return false;
		}
		if(document.form.duty.value==""){
			alert("직책이 입력되지 않았습니다.");
			document.form.duty.focus();
			return false;
		}
		if(document.form.phone.value==""){
			alert("연락처가 입력되지 않았습니다.");
			document.form.phone.focus();
			return false;
		}
		if(document.form.address.value==""){
			alert("주소가 입력되지 않았습니다.");
			documetn.form.address.focus();
			return false;
		}
		form.action="infoProcess.jsp";
	}
function changesubmit(){
		document.form.submit();
	}
	
