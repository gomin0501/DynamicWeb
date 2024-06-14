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
	 							//form name을 가져와야한다.
	String pid=request.getParameter("productId");
	String qty=request.getParameter("orderQty");
	//글 사라짐 방지하기
	String orderD=request.getParameter("orderDate");
	String orderN=request.getParameter("orderName");
	String name="";
	int price=0,total=0;
	int pQty=0;
	if(orderD==null){
		orderD="";
	}
	if(orderN==null){
		orderN="";
	}
	if(qty==null||qty==""){
		pQty=0;
	}else{
		pQty=Integer.parseInt(qty);
	}
	
	try{
		String sql="select productid,name,unitprice,unitsInstock from product0312 where productid=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1,pid);
		rs=pstmt.executeQuery();
		
		if(rs.next()){
			pid=rs.getString(1);
			name=rs.getString(2);
			price=rs.getInt(3);
			total=pQty*price;
			int unitsInstock=rs.getInt(4);
			if(pQty>unitsInstock){
				%>
				<script>
					alert("재고가 부족합니다.");
					history.back(-1);
				</script>
				<%
			}
		}else if(pid==null){
			pid="";
		}else{
			
		%>
		<script>
			alert("등록되어 있지 않은 상품코드 입니다.");
			history.back(-1);
		</script>
		<%}
	}catch(Exception e){
		System.out.println("연결 오류");		
		e.printStackTrace();
}
	
%>
<section>
<form name="form" method="post" action="addOrder.jsp">
<h2>주문 정보 등록</h2>
<table border=1>
<tr>
	<th>주문일자</th>
	<td><input type="text" name="orderDate" value="<%=orderD %>"></td>
	<th>주문자 이름</th>
	<td><input type="text" name="orderName" value="<%=orderN %>"></td>
</tr>
<tr>
	<th>상품코드</th>
	<td><input type="text" name="productId" onchange="changesubmit();" value="<%=pid %>"></td>
	<th>상 품 명</th>
	<td><input type="text" name="productName" value="<%=name %>"></td>
</tr>
<tr>
	<th>단 가</th>
	<td><input type="text" name="unitPrice" placeholder="0" value="<%=price %>"></td>
	<th>주문수량</th>
	<td><input type="text" name="orderQty" placeholder="0" onchange="changesubmit();" value="<%=pQty %>"></td>
</tr>
<tr>
	<th>주문금액</th>
	<td>
		<input type="text" name="total" placeholder="0" value="<%=total %>">
	</td>
	<th>주문주소</th>
	<td><input type="text" name="orderAddress">
	</td>
</tr>
<tr>
	<td colspan=4 class="button">
	<button><a href="orderList.jsp">목록</a></button>
	<button type="submit" onclick="check()">저장</button>
	</td>
</tr>

</table>
</form>
<script src="orderForm.js"></script>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>