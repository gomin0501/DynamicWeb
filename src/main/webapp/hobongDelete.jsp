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
	String dung=request.getParameter("dunggub");
	
	String sql="delete from hobong0307 where dunggub=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1,dung);
	pstmt.executeUpdate();
%>
<script>
	alert("삭제되었습니다.");
	location.href="hobongSelect.jsp";
</script>
</body>
</html>