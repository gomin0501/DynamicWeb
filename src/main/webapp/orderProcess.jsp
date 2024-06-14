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
	try{
	String date=request.getParameter("orderDate");
	String orderN=request.getParameter("orderName");
	String pid=request.getParameter("productId");
	String unitP=request.getParameter("unitPrice");
	String oQty=request.getParameter("orderQty");
	String address=request.getParameter("orderAddress");
	
	//sql문(database table)에 값 넣기
	String sql="insert into order0312 values(?,?,?,?,?,?)";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1,date);//번호는 물음표 순서
	pstmt.setString(2,orderN);
	pstmt.setString(3,pid);
	pstmt.setString(4,unitP);
	pstmt.setString(5,oQty);
	pstmt.setString(6,address);
	
	pstmt.executeUpdate();//실행
	
	//재고값바꾸기
	sql="update product0312 set unitsinstock=unitsinstock-? where productid=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setInt(1,Integer.parseInt(oQty));
	pstmt.setString(2,pid);
	pstmt.executeUpdate();
	}catch(Exception e){
		System.out.println("연결 오류");
		e.printStackTrace();
		
	}
	
%>
<script>
	alert("입력이 완료되었습니다");
	//orderList로 화면이 넘어가기
	location.href="orderList.jsp";
</script>
</body>
</html>