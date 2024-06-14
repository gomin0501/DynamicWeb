<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="dbconn.jsp" %>
<%
	PreparedStatement pstmt=null;
	String cid=request.getParameter("custid");
	
	String sql="delete from customer0305 where custid=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1,cid);
	pstmt.executeUpdate();
	
%>
<script>
	alert("삭제 성공");
	location.href="customerSelect.jsp";
</script>
</body>
</html>