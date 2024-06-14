//addOrder스크립트
function check(){
		if(document.form.orderDate.value==""){
			alert("주문일자를 입력하세요.");
			document.form.orderDate.focus();
			return false;
		}
		
		
		if(document.form.orderName.value==""){
			alert("주문자 이름을 입력하세요");
			document.form.orderName.focus();
			return false;
		}
		if(document.form.productId.value==""){
			alert("직책수당을 입력하세요");
			document.form.productId.focus();
			return false;
		}
		if(document.form.orderQty.value==""){
			alert("주문수량을 입력하세요");
			documetn.form.orderQty.focus();
			return false;
		}
		if(document.form.orderAddress.value==""){
			alert("주문주소를 입력하세요");
			documetn.form.orderAddress.focus();
			return false;
		}
		form.action="orderProcess.jsp";
	}
function changesubmit(){
		document.form.submit();
	}
	
