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
<section>
<h2>주문 목록</h2>
<table border=1 id="order">
	<tr>
		<th>no</th>
		<th>주문일자</th>
		<th>주문자 성명</th>
		<th>상품번호</th>
		<th>상품명</th>
		<th>단가</th>
		<th>주문수량</th>
		<th>주문자주소</th>
		<th>구분</th>
	</tr>
<%@ include file="dbconn.jsp" %>
<%
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	try{
		String sql="select to_char(orderdate,'yyyy-mm-dd'),ordername,a.productid,a.name,b.unitprice,orderqty,orderaddress from product0312 a,order0312 b where a.productid=b.productid";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		int n=0;
		
		while(rs.next()){
			String date=rs.getString(1);
			String orderN=rs.getString(2);
			String pid=rs.getString(3);
			String name=rs.getString(4);
			String unitP=rs.getString(5);
			String qty=rs.getString(6);
			String orderAdd=rs.getString(7);
			n++;
		%>
	<tr>
		<td><%=n %></td>
		<td><%=date %></td>
		<td><%=orderN %></td>
		<td><%=pid %></td>
		<td><%=name %></td>
		<td><%=unitP %></td>
		<td><%=qty %></td>
		<td><%=orderAdd %></td>
		<td>
			<a href="orderUpdate.jsp?productId=<%=pid %>">수정</a>/
			<a href="orderDelete.jsp?productId=<%=pid %>"
			onclick="if(!confirm('삭제할까요?')) return false;">삭제</a>
		</td>
	</tr>	
		
	<%
		}
		
	}catch(Exception e){
		System.out.println("데이터베이스 읽기 오류");
		e.printStackTrace();
	}
%>
</table>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>