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
	ResultSet rs=null;
	//form데이터 가져오기
	String title=request.getParameter("title");
	String name=request.getParameter("name");
	String ps=request.getParameter("password");
	String memo=request.getParameter("memo");
	
	try{
		String sql="select count(*) from board2024";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		
		int cnt=0;
		if(rs.next()){
			cnt=rs.getInt(1)+1;
		}else{
			cnt=0;
		}
		
	sql="insert into board2024(num,name,password,title,memo,ref,time) values(?,?,?,?,?,?,sysdate)";
	pstmt=conn.prepareStatement(sql);
	pstmt.setInt(1,cnt);
	pstmt.setString(2,name);
	pstmt.setString(3,ps);
	pstmt.setString(4,title);
	pstmt.setString(5,memo);
	pstmt.setInt(6,cnt);
	
	pstmt.executeUpdate();//실행
	
	}catch(Exception e){
		System.out.println("연결 오류");
		e.printStackTrace();
	}
	
	
%>
<script>
	alert("입력한 글을 저장하였습니다.");
	location.href="board.jsp";
</script>
</body>
</html>