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
	//form데이터 가져오기
	String pid=request.getParameter("productId");
	String name=request.getParameter("name");
	String price=request.getParameter("unitprice");
	String desc=request.getParameter("description");
	String manu=request.getParameter("manufacturer");
	String cate=request.getParameter("category");
	String instock=request.getParameter("unitsInstock");
	String con=request.getParameter("condition");
	
	//sql문(database table)에 값 넣기
	String sql="insert into product2024 values(?,?,?,?,?,?,?,?)";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1,pid);//번호는 물음표 순서
	pstmt.setString(2,name);
	pstmt.setString(3,price);
	pstmt.setString(4,desc);
	pstmt.setString(5,cate);
	pstmt.setString(6,manu);
	pstmt.setString(7,instock);
	pstmt.setString(8,con);
	
	pstmt.executeUpdate();//실행
	
%>
<script>
	alert("등록이 완료되었습니다");
	//productSelect로 화면이 넘어가기
	location.href="productSelect.jsp";
</script>
</body>
</html>