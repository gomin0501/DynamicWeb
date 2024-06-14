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
	//로그인 구현
	//한글 패치
	request.setCharacterEncoding("utf-8");
	//로그인 폼 값 가져오기
	String id=request.getParameter("id");
	String ps=request.getParameter("password");
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	try{
		String sql="select id,name,password from member2024 where id=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1,id);
		rs=pstmt.executeQuery();
		
		if(rs.next()){
			String userID=rs.getString(1);
			String userName=rs.getString(2);
			String userPs=rs.getString(3);
			if(ps.equals(userPs)){
				%>
				<%=userName %>님 환영합니다.
				<%
					session.setAttribute("s_Name",userName);	
					session.setAttribute("s_Id",userID);
					response.sendRedirect("home.jsp");
			}else{
				%>
				<script>
					alert("패스워드가 일치하지 않습니다.");
					history.back(-1);
				</script>
				<%
			}
		}else{
			%>
			<script>
				alert("등록되지 않은 id입니다");
				history.back(-1);
			</script>
		<%}
	}catch(Exception e){
		System.out.println("연결 오류");
		e.printStackTrace();
	}
%>
</body>
</html>