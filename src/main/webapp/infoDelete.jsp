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
	String id=request.getParameter("id");
	
	String sql="delete from info0307 where id=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1,id);
	pstmt.executeUpdate();
%>
<script>
	alert("사원정보가 삭제되었습니다.");
	location.href="infoSelect.jsp";
</script>
</body>
</html>