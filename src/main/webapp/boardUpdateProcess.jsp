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
	request.setCharacterEncoding("UTF-8");
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	int num=Integer.parseInt(request.getParameter("num")); 
	String psw=request.getParameter("password"); //폼에서 가져온 비밀번호
	String title=request.getParameter("title");
	String name=request.getParameter("name");
	String memo=request.getParameter("memo");
try{
	String sql="select password from board2024 where num=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setInt(1,num);
	rs=pstmt.executeQuery();
	if(rs.next()){
		String ps=rs.getString(1); //데이터베이스에서 가져온 비밀번호
		if(psw.equals(ps)){
		sql="update board2024 set title=?,name=?,password=?,memo=? where num=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1,title);
		pstmt.setString(2,name);
		pstmt.setString(3,psw);
		pstmt.setString(4,memo);
		pstmt.setInt(5,num);	
	
		pstmt.executeUpdate();
		%>
		<script>
			alert("게시글 수정 성공");
			location.href="board.jsp";
		</script>
		<%
		}else{
			%>
		<script>
			alert("잘못된 비밀번호 입니다.");
			history.back(-1);
		</script>
		<%
		}
	}
}catch(Exception e){
	System.out.println("연결 오류");
	e.printStackTrace();
}
%>

</body>
</html>