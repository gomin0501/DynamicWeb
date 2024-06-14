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
	String gajok=request.getParameter("gajok");
	String jikchak=request.getParameter("jikchak");
	String gunsok=request.getParameter("gunsok");
	String gita=request.getParameter("gitasudang");
	
	String sql="update sudang0307 set gajok=?,jikchak=?,gunsok=?,gitasudang=? where id=?";
	
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1,gajok);
	pstmt.setString(2,jikchak);
	pstmt.setString(3,gunsok);
	pstmt.setString(4,gita);
	pstmt.setString(5,id);
	
	pstmt.executeUpdate();
	
%>
<script>
	alert("수당 수정 성공");
	location.href="sudangSelect.jsp";
</script>
</body>
</html>