<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<%@ include file="dbconn.jsp" %>
<%
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	 	
	 	int newQty=0;
	 	if(request.getParameter("orderQty")==null){
	 		newQty=0;
	 	}else{
	 		newQty=Integer.parseInt(request.getParameter("orderQty"));
	 	}
	 	int nQty=0;
	try{
		String pid=request.getParameter("productId");
		String sql="select a.productid,to_char(orderdate,'yyyy-mm-dd'),ordername,b.name,a.unitprice,b.unitsinstock,orderqty,orderaddress from order0312 a, product0312 b where a.productid=b.productid and a.productid=? ";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1,pid);
		rs=pstmt.executeQuery();
		int total=0;
		if(rs.next()){
			String date=rs.getString(2);
			String orderN=rs.getString(3);
			String name=rs.getString(4);
			int price=rs.getInt(5);
			int stock=rs.getInt(6);
			int qty=rs.getInt(7);
			String address=rs.getString(8);
			
			
			if(newQty==0 || newQty==qty){			
		 		nQty=qty;
		 	}else{
		 		nQty=newQty;
		 	}
			total=nQty*price;
			if(nQty>stock){
			 %>
			 <script>
			 	alert("재고가 부족합니다.");
			 	history.back(-1);
			 </script>		
		<%} %>	
		


<section>
<form name="form" method="post" action="orderUpdate.jsp">
<h2>주문 정보 수정</h2>
<table border=1>
<tr>
	<th>주문일자</th>
	<td><input type="text" name="orderDate" value="<%=date %>"></td>
	<th>주문자 이름</th>
	<td><input type="text" name="orderName" value="<%=orderN %>"></td>
</tr>
<tr>
	<th>상품코드</th>
	<td><input type="text" name="productId" value="<%=pid %>"></td>
	<th>상 품 명</th>
	<td><input type="text" name="productName" value="<%=name %>"></td>
</tr>
<tr>
	<th>단 가</th>
	<td><input type="text" name="unitPrice" placeholder="0" value="<%=price %>"></td>
	<th>주문수량</th>
	<td><input type="text" name="orderQty" placeholder="0" onchange="changesubmit();" value="<%=nQty %>"></td>
</tr>
<tr>
	<th>주문금액</th>
	<td>
		<input type="text" name="total" placeholder="0" value="<%=total %>">
	</td>
	<th>주문주소</th>
	<td><input type="text" name="orderAddress" value="<%=address %>">
	</td>
</tr>
<tr>
	<td colspan=4 class="button">
	<button><a href="orderList.jsp">목록</a></button>
	<button type="submit" onclick="check()">저장</button>
	</td>
</tr>
<%
		}
	}catch(Exception e){
		System.out.println("연결 오류");		
		e.printStackTrace();
}
	
%>
</table>
</form>
<script src="orderUpdateForm.js"></script>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>