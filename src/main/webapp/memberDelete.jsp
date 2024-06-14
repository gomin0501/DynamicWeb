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
	String id=request.getParameter("id");//memberList "삭제"에 링크된 id랑 이름이 같아야한다
	//목록 삭제하기:delete from 테이블 이름 where 목록
	
	//넘어오는 데이터 id가 들어가기때문에 ?로 준다
	String sql="delete from member2024 where id=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1,id);
	pstmt.executeUpdate();
%>
<script>
	alert("회원 삭제 성공");
	location.href="memberSelect.jsp";
</script>
</body>
</html>