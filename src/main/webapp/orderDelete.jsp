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
	ResultSet rs=null;
	String pid=request.getParameter("productId");
	int orderQty=0;
	try{
	//재고 수정 위해 수량 값을 폼에서 가져오기
	String sql="select productid,orderqty from order0312 where productid=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1,pid);
	rs=pstmt.executeQuery();
	if(rs.next()){
		orderQty=rs.getInt(2);
	}
	
	sql="delete from order0312 where productid=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1,pid);
	pstmt.executeUpdate();
	//재고 수량 처리
	sql="update product0312 set unitsinstock=unitsinstock + ? where productid=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setInt(1,orderQty);
	pstmt.setString(2,pid);
	pstmt.executeUpdate();
	%>
	<script>
		alert("주문정보 삭제 완료");
		location.href="orderList.jsp";
		
	</script>
	
	<%
	}catch(Exception e){
		System.out.println("연결 오류");
		e.printStackTrace();
	}
%>

</body>
</html>