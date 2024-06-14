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
	String dmno=request.getParameter("dmno");
	try{
		String sql="delete from dm0305 where dmno=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1,dmno);
		
		pstmt.executeUpdate();
	%>	
<script>
	alert("삭제 성공");
	location.href="dmSelect.jsp";
</script>
<%
}catch(Exception e){
	System.out.println("삭제오류");
	e.printStackTrace();
}
%>
</body>
</html>