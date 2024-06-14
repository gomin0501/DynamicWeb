//addProduct스크립트
function check(){
		if(document.form.productId.value==""){
			alert("상품코드를 입력하세요");
			document.form.productId.focus();
			return false;
		}
		if(document.form.name.value==""){
			alert("상품명을 입력하세요");
			document.form.name.focus();
			return false;
		}
		if(document.form.name.value.length<4){
			alert("[상품명]\n 최소4자에서 최대 50자까지 입력하세요")
			document.form.name.focus();
			return false;
		}
		if(document.form.unitprice.value==""){
			alert("가격을 입력하세요");
			document.form.unitprice.focus();
			return false;
		}
		if(document.form.description.value==""){
			alert("상세정보를 입력하세요");
			document.form.description.focus();
			return false;
		}
		if(document.form.manufacturer.value==""){
			alert("제조사를 입력하세요");
			document.form.manufacturer.focus();
			return false;
		}
		if(document.form.unitsInstock.value==""){
			alert("재고수를 입력하세요");
			document.form.unitsInstock.focus();
			return false;
		}
		
		
		let cnt=0;
		let rdo=document.getElementsByName("condition");
		for (let i=0;i<rdo.length;i++){
			if (rdo[i].checked == true){
				cnt++;
				break;
			}
		}
		if(cnt == 0){
			alert("상태를 체크하세요.");
			return false;
		}
		
		document.form.submit();
	}