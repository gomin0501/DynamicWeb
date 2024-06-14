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
	
	String sql="insert into sudang0307 values(?,?,?,?,?)";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1,id);
	pstmt.setString(2,gajok);
	pstmt.setString(3,jikchak);
	pstmt.setString(4,gunsok);
	pstmt.setString(5,gita);
	
	pstmt.executeUpdate();
	
%>
<script>
	alert("수당등록 성공");
	location.href="sudangSelect.jsp";
</script>
</body>
</html>