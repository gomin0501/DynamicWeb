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
	//form에서 데이터 가져오기
	String id=request.getParameter("id");
	String name=request.getParameter("name");
	String gender=request.getParameter("gender");
	String ps=request.getParameter("ps");
	String email=request.getParameter("emailId")+"@"+request.getParameter("email");
	String phone=request.getParameter("ph1")+"-"+request.getParameter("ph2")+"-"+request.getParameter("ph3");
	String address=request.getParameter("address");
	
	//sql문으로 넘겨주기. 이름들은 sql에서 지정한 이름과 같아야한다
	String sql="update member0312 set name=?,gender=?,password=?,email=?,phone=?,address=? where id=?";
	//물음표에 값을 넘겨준다.
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1,name);
	pstmt.setString(2,gender);
	pstmt.setString(3, ps);
	pstmt.setString(4, email);
	pstmt.setString(5, phone);
	pstmt.setString(6, address);
	pstmt.setString(7, id);
	
	pstmt.executeUpdate();
	
	
%>
<script>
	alert("회원 수정 성공");
	location.href="memberList.jsp";
</script>
</body>
</html>