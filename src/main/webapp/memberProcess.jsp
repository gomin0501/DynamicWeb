
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
	int id=Integer.parseInt(request.getParameter("id"));
	String name=request.getParameter("name");
	String ps=request.getParameter("password");
	String gender=request.getParameter("gender");
	String birth=request.getParameter("year")+request.getParameter("month")+request.getParameter("day");
	String email=request.getParameter("emailId")+"@"+request.getParameter("email");
	String phone=request.getParameter("ph1")+"-"+request.getParameter("ph2")+"-"+request.getParameter("ph3");
	String address=request.getParameter("address");
	String []val=request.getParameterValues("interest");
	String interest="";
	if(val !=null){
		for(int i=0;i<val.length;i++){
			if(i==(val.length-1)){
				interest+=val[i];
			}else{
				interest+=val[i]+",";
			}
		}
	}
	
	//sql문(database table)에 값 넣기
	String sql="insert into member2024 values(?,?,?,?,?,?,?,?,?,sysdate)";
	pstmt=conn.prepareStatement(sql);
	pstmt.setInt(1,id);//번호는 물음표 순서
	pstmt.setString(2,ps);
	pstmt.setString(3,name);
	pstmt.setString(4,gender);
	pstmt.setString(5,birth);
	pstmt.setString(6,email);
	pstmt.setString(7,phone);
	pstmt.setString(8,address);
	pstmt.setString(9,interest);
	
	pstmt.executeUpdate();//실행
	
%>
<script>
	alert("등록이 완료되었습니다");
	location.href="memberSelect.jsp";
</script>
</body>
</html>