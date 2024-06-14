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
	String id=request.getParameter("id");
	String name=request.getParameter("name");
	String ps=request.getParameter("ps");
	String gender=request.getParameter("gender");
	String email=request.getParameter("emailId")+"@"+request.getParameter("email");
	String phone=request.getParameter("ph1")+"-"+request.getParameter("ph2")+"-"+request.getParameter("ph3");
	String address=request.getParameter("address");
	
	//sql문(database table)에 값 넣기
	String sql="insert into member0312 values(?,?,?,?,?,?,?)";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1,id);//번호는 물음표 순서
	pstmt.setString(2,name);
	pstmt.setString(3,ps);
	pstmt.setString(4,gender);
	pstmt.setString(5,email);
	pstmt.setString(6,phone);
	pstmt.setString(7,address);
	
	pstmt.executeUpdate();//실행
	
%>
<script>
	alert("입력이 완료되었습니다");
	//memberList로 화면이 넘어가기
	location.href="memberList.jsp";
</script>
</body>
</html>