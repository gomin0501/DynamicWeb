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
	ResultSet rs=null;//서버에서 가져오는 데이터가 있으므로 rs만들기
	//form데이터 가져오기
	String date=request.getParameter("orderDate");
	String orderN=request.getParameter("orderName");
	String pid=request.getParameter("productId");
	String unitP=request.getParameter("unitPrice");
	String oQty=request.getParameter("orderQty");
	String address=request.getParameter("orderAddress");
	//재고값 바꾸기
	int newQty=Integer.parseInt(oQty);
	int oldQty=0; //원래 수량
	
	//sql문(database table)에 값 넣기
	try{
	String sql="select orderqty from order0312 where orderdate=? and ordername=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1,date);
	pstmt.setString(2,orderN);
	rs=pstmt.executeQuery();
	if(rs.next()){
		oldQty=rs.getInt(1);
	}
	int cQty=newQty-oldQty;
	System.out.println("newQty : "+newQty+"oldQty : "+oldQty);
	sql="update order0312 set orderdate=?,ordername=?,unitprice=?,orderqty=?,orderaddress=? where productid=? ";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1,date);//번호는 물음표 순서
	pstmt.setString(2,orderN);
	pstmt.setString(3,unitP);
	pstmt.setString(4,oQty);
	pstmt.setString(5,address);
	pstmt.setString(6,pid);
	
	pstmt.executeUpdate();//실행
	
	//재고 수정
	if(cQty !=0){
		sql="update product2024 set unitinstock=unitinstock-? where productid=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setInt(1,cQty);
		pstmt.setString(2,pid);
		pstmt.executeUpdate();
		
	}
	
	%>
	<script>
		alert("주문정보 저장 성공");
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