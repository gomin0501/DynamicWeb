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
	String code=request.getParameter("code");
	String name=request.getParameter("name");
	
	
	//sql문(database table)에 값 넣기
	String sql="update area0305 set areaname=? where areacode=?";
	
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1,name);
	pstmt.setString(2,code);//번호는 물음표 순서
	
	
	pstmt.executeUpdate();//실행
	
%>
<script>
	alert("수정이 완료되었습니다");
	//areaSelect로 화면이 넘어가기
	location.href="areaSelect.jsp";
</script>
</body>
</html>