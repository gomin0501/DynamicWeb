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
	String code=request.getParameter("areacode");
	
	
	String sql="delete from area0305 where areacode=?";
	
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1,code);
	
	pstmt.executeUpdate();//실행
	
%>
<script>
	alert("삭제 성공");
	//areaSelect로 화면이 넘어가기
	location.href="areaSelect.jsp";
</script>
</body>
</html>