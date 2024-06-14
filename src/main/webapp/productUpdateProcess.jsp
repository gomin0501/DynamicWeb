<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="dbconn.jsp" %>
<%
	PreparedStatement pstmt=null;
	
String pid=request.getParameter("productId");
String name=request.getParameter("name");
String price=request.getParameter("unitprice");
String desc=request.getParameter("description");
String manu=request.getParameter("manufacturer");
String cate=request.getParameter("category");
String instock=request.getParameter("unitsInstock");
String con=request.getParameter("condition");

String sql="update product0312 set name=?,unitprice=?,description=?,category=?,manufacturer=?,unitsInstock=?,condition=? where productId=?";

pstmt=conn.prepareStatement(sql);
pstmt.setString(1,name);//번호는 물음표 순서
pstmt.setString(2,price);
pstmt.setString(3,desc);
pstmt.setString(4,cate);
pstmt.setString(5,manu);
pstmt.setString(6,instock);
pstmt.setString(7,con);
pstmt.setString(8,pid);

pstmt.executeUpdate();

%>
<script>
	alert("상품 수정 성공");
	location.href="productSelect.jsp"; 
</script>
</body>
</html>